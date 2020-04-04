from django.shortcuts import render
from django.views.generic import View
from django.http import JsonResponse
from django_redis import get_redis_connection
from apps.goods.models import GoodsSKU
from utils.mixin import LoginRequiredMixin


class CartAddView(View):
    def post(self, request):
        user = request.user
        if not user.is_authenticated():
            return JsonResponse({'res': 0, 'errmsg': '请先登录'})

        sku_id = request.POST.get('sku_id')
        count = request.POST.get('count')

        if not all([sku_id, count]):
            return JsonResponse({'res': 1, 'errmsg': '数据不完整'})
        try:
            count = int(count)
        except Exception as e:
            return JsonResponse({'res': 2, 'errmsg': '不是一个合法的数字'})
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({'res': 3, 'errmsg': '商品不存在'})

        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id
        cart_count = conn.hget(cart_key, sku_id)
        if cart_count:
            cart_count = int(cart_count)
            cart_count += count
        else:
            if count > sku.stock:
                return JsonResponse({'res': 4, 'errmsg': '商品库存不足'})
            conn.hset(cart_key, sku_id, count)

        return JsonResponse({'res': 5, 'successmsg': '添加购物车成功'})


class CartInfoView(LoginRequiredMixin, View):
    def get (self, request):
        user = request.user
        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id
        cart_dict = conn.hgetall(cart_key)

        skus = []
        total_count = 0
        total_prict = 0
        for sku_id, count in cart_dict.items():
            sku = GoodsSKU.objects.get(id=sku_id)
            amount = sku.price*int(count)
            sku.amount = amount
            sku.count = count
            skus.append(sku)
            total_count += int(count)
            total_prict += amount

        context = {
            'skus': skus,
            'total_count': total_count,
            'total_price': total_prict,
        }
        return render(request, 'cart.html', context=context)


class CartUpdateView(View):
    def post(self, request):
        user = request.user
        if not user.is_authenticated():
            return JsonResponse({'res': 0, 'errmsg': '请先登录'})

        sku_id = request.POST.get('sku_id')
        count = request.POST.get('count')
        # print(sku_id, count, 'fuck....')

        if not all([sku_id, count]):
            return JsonResponse({'res': 1, 'errmsg': '数据不完整'})
        try:
            count = int(count)
        except Exception as e:
            return JsonResponse({'res': 2, 'errmsg': '不是一个合法的数字'})
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({'res': 3, 'errmsg': '商品不存在'})

        conn = get_redis_connection('default')
        cart_key = "cart_%d" % user.id

        if count > sku.stock:
            return JsonResponse({'res': 4, 'errmsg': '商品库存不足'})
        conn.hset(cart_key, sku_id, count)

        # 通过加号来更新数据库
        total_count = 0
        vals = conn.hvals(cart_key)
        for val in vals:
            total_count += int(val)

        return JsonResponse({'res': 5, 'total_count': total_count, 'message': '更新成功'})



class CartDeleteView(View):
    def post(self, request):
        user = request.user
        if not user.is_authenticated():
            return JsonResponse({'res': 0, 'errmsg': '请先登录'})
        else:
            sku_id = request.POST.get('sku_id')

            if not sku_id:
                return JsonResponse({'res': 1, 'errmsg': '无效的商品id'})
            try:
                sku = GoodsSKU.objects.get(id=sku_id)
            except GoodsSKU.DoesNotExist:
                return JsonResponse({'res': 2, 'errmsg': '商品不存在'})
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id

            # 使用hdel删除redis中的数据
            conn.hdel(cart_key, sku_id)
            total_count = 0
            vals = conn.hvals(cart_key)
            for val in vals:
                total_count += int(val)
            return JsonResponse({'res': 3, 'total_count': total_count, 'message': '购物车商品删除成功'})

