from django.shortcuts import render, redirect
from django.views.generic import  View
from django.core.urlresolvers import  reverse
from apps.goods.models import GoodsSKU
from django_redis import get_redis_connection
from apps.user.models import Address
from utils.mixin import LoginRequiredMixin
from django.http import JsonResponse
from apps.order.models import OrderInfo, OrderGoods
from datetime import datetime
from django.db import transaction
# from alipay import AliPay, ISVAlipay
from django.conf import settings
import os
# Create your views here.


class OrderPlaceView(LoginRequiredMixin, View):
    def post(self, request):
        user = request.user
        sku_ids = request.POST.getlist('sku_ids')

        if not sku_ids:
            return redirect(reverse('cart:show'))

        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id
        skus = []
        total_count = 0
        total_price = 0
        for sku_id in sku_ids:
            sku = GoodsSKU.objects.get(id=sku_id)
            count = conn.hget(cart_key, sku_id)
            amount = sku.price*int(count)
            sku.count = count
            sku.amount = amount
            skus.append(sku)
            total_count += int(count)
            total_price += amount

        # 运费, 默认是10
        transit_price = 10
        total_pay = total_price + transit_price
        addrs = Address.objects.filter(user=user)
        sku_ids = ','.join(sku_ids)
        context = {
            'skus': skus,
            'total_count': total_count,
            'total_price': total_price,
            'transit_price': transit_price,
            'total_pay': total_pay,
            'addrs': addrs,
            'sku_ids': sku_ids,
        }
        return render(request, 'place_order.html', context=context)


class OrderCommitView(View):
    @transaction.atomic
    def post(self, request):
        user = request.user
        if not user.is_authenticated():
            return JsonResponse({'res': 0, 'errmsg':'用户未登录'})
        addr_id = request.POST.get('addr_id')
        pay_method = request.POST.get('pay_method')
        sku_ids = request.POST.get('sku_ids')
        if not all([addr_id, pay_method, sku_ids]):
            return JsonResponse({'res': 1, 'errmsg': '参数不完整'})
        if pay_method not in OrderInfo.PAY_METHODS.keys():
            return JsonResponse({'res': 2, 'errmsg': '非法的支付方式'})
        try:
            addr = Address.objects.get(id=addr_id)
        except Address.DoesNotExist:
            return JsonResponse({'res': 3, 'errmsg': '地址非法'})

        # todo: 添加订单的核心业务
        order_id = datetime.now().strftime('%Y%m%d%H%M%S') + str(user.id)
        # 运费
        transit_price = 10
        # 总数目和总金额
        total_price = 0
        total_count = 0
        # todo: 创建保存点
        save_id = transaction.savepoint()
        # todo: 向df_order_info表中添加一条记录
        try:
            order = OrderInfo.objects.create(order_id=order_id,
                                             user=user,
                                             addr=addr,
                                             pay_method=pay_method,
                                             total_count=total_count,
                                             total_price=total_price,
                                             transit_price=transit_price)
            # todo: 用户订单有几个商品, 我们就添加几个记录
            sku_ids = sku_ids.split(',')
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            for sku_id in sku_ids:
                for i in range(3):
                    try:
                        # sku = GoodsSKU.objects.select_for_update().get(id=sku_id)
                        sku = GoodsSKU.objects.get(id=sku_id)
                    except:
                        transaction.savepoint_rollback(save_id)
                        return JsonResponse({'res': 4, 'errmsg': '商品不存在'})
                    count = conn.hget(cart_key, sku_id)
                    if int(count) > sku.stock:
                        transaction.savepoint_rollback(save_id)
                        return JsonResponse({'res': 6, 'errmsg': '商品不存在'})
                    # todo: 向df_order_goods表中添加一条记录
                    origin_stock = sku.stock
                    origin_sales = sku.sales
                    new_stock = origin_stock - int(count)
                    new_sales = origin_sales + int(count)
                    # update df_goods_sku set stock=new_stock, sales=new_sales where id=sku_id and stock=orgin_stock
                    res = GoodsSKU.objects.filter(id=sku_id, stock=origin_stock).update(stock=new_stock, sales=new_sales)
                    if res == 0:
                        if i == 2:
                            transaction.savepoint_rollback(save_id)
                            return JsonResponse({'res': 7, 'errmsg': '订单失败'})
                        continue

                    OrderGoods.objects.create(order=order,
                                              sku=sku,
                                              count=count,
                                              price=sku.price)
                    # todo: 更新商品的库存和销量
                    # sku.stock -= int(count)
                    # sku.sales += int(count)
                    # sku.save()

                    # todo: 累加计算订单商品的总数量和总价格
                    amount = sku.price * int(count)
                    total_count += int(count)
                    total_price += amount

                # todo: 更新订单信息表中的商品的总数量和总价格
                order.total_count = total_count
                order.total_price = total_price
                order.save()
                break
        except Exception as e:
            transaction.savepoint_rollback(save_id)
            return JsonResponse({'res': 7, 'errmsg': '下单失败'})
        transaction.savepoint_commit(save_id)

        # todo: 清除购物车中对应的商品记录
        conn.hdel(cart_key, *sku_ids)
        return JsonResponse({'res': 5, 'message': '创建成功'})


class OrderPayView(View):
    # def post(self, request):
    #     # 用户登录
    #     user = request.user
    #     if not user.is_authenticated():
    #         return JsonResponse({"res": 0, 'errmsg': '用户未登录'})
    #     order_id = request.POST.get('order_id')
    #     if not order_id:
    #         return JsonResponse({'res': 1, 'errmsg': '无效的订单id'})
    #     try:
    #         order = OrderInfo.objects.get(order_id=order_id,
    #                                       user=user,
    #                                       pay_method=3,
    #                                       order_status=1)
    #     except OrderInfo.DoesNotExist:
    #         return JsonResponse({'res': 2, 'errmsg': '无效的订单'})
    #
    #     # 业务处理: 使用python sdk调用支付宝支付接口
    #     alipay = AliPay(
    #         appid="",  # 应用id
    #         app_notify_url=None,  # 默认回调url
    #         app_private_key_path=os.path.join(settings.BASE_DIR, 'apps/order/app_private_key.pem'),
    #         alipay_pubulic_key_path=os.path.join(settings.BASE_DIR, 'apps/order/alipay_public_key.pem'),  # 支付宝公钥, 验证支付宝回传消息使用
    #         sign_type="RSA2",  # 加密算法, 你配置的加密算法
    #         debug=True  # 默认沙箱中True
    #     )
    #     # todo: 调用支付宝接口 https://openapi.alipay.com/gateway.do? + order_string
    #     # todo: 调用支付宝接口 https://openapi.alipaydev.com/gateway.do? + order_string
    #     total_pay = order.total_price + order.transit_price  # Decimal 类型的数据是没办法序列化为json的
    #     order_string = alipay.api_alipay_trade_page_pay(
    #         out_trade_no=order_id,  # 订单 id
    #         total_amount=0.01,
    #         subject="天天生鲜%s"%order_id,
    #         return_url=None,
    #         notify_url=None  # 可选, 不填默认notify url
    #     )
    #     # 返回应答
    #     pay_url = 'https://openapi.alipaydev.com/gateway.do?' + order_string
    #     return JsonResponse({'res': 3, 'pay_url': pay_url})


# order/comment/order_id
    def post(self, request):
        pass


class CommentView(View):
    def get(self, request, order_id):
        user = request.user

        if not order_id:
            return redirect(reverse('user:order'))
        try:
            order = OrderInfo.objects.get(order_id=order_id, user=user)
        except OrderInfo.DoesNotExist:
            return redirect(reverse('user:order'))
        order.status_name = OrderInfo.ORDER_STATUS[order.order_status]

        order_skus = OrderGoods.objects.filter(order_id=order_id)
        for order_sku in order_skus:
            amount = order_sku.count * order_sku.price
            order_sku.amount = amount
        order.order_skus = order_skus
        return render(request, "order_comment.html", {'order': order})

    def post(self, request, order_id):
        user = request.user

        if not order_id:
            return redirect(reverse('user:order'))
        try:
            order = OrderInfo.objects.get(order_id=order_id, user=user)
        except OrderInfo.DoesNotExist:
            return redirect(reverse('user:order'))

        total_count = request.POST.get('total_count')
        total_count = int(total_count)

        for i in range(1, total_count + 1):
            sku_id = request.POST.get("sku_%d" % i)
            content = request.POST.get('content_%d' % i, '')
            try:
                order_goods = OrderGoods.objects.get(order=order, sku_id=sku_id)
            except OrderGoods.DoesNotExist:
                continue

            order_goods.comment = content
            order_goods.save()
        order.order_status = 5
        order.save()
        return redirect(reverse("user:order", kwargs={"page": 1}))

