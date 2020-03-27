from django.shortcuts import(
    render,
    HttpResponse,
    redirect,
)
import re
from apps.user.models import User, Address
from django.core.urlresolvers import reverse
from django.views.generic import View
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from django.conf import settings
from itsdangerous import SignatureExpired  # 解密产生的异常类
from django.core.mail import send_mail
from celery_tasks.tasks import send_register_active_email
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from utils.mixin import LoginRequiredMixin
from django_redis import get_redis_connection
from apps.goods.models import GoodsSKU
from apps.order.models import OrderGoods, OrderInfo
from django.core.paginator import Paginator
import time


# Create your views here.

@login_required
def index(request):
    return render(request, 'base.html')


class RegisterView(View):
    """注册类"""
    def get(self, request):
        return render(request, 'register.html')

    def post(self, request):
        # 接受数据
        username = request.POST.get('user_name')
        password = request.POST.get('pwd')
        email = request.POST.get('email')
        allow = request.POST.get('allow')
        # 数据校验
        if not all((username, password, email)):
            return render(request, 'register.html', {'errmsg': '数据不完整'})
        if not re.match(r'^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', email):
            return render(request, 'register.html', {'errmsg': '邮箱格式不正确'})
        if allow != 'on':
            return render(request, 'register.html', {'errmsg': '请同意协议'})
        try:
            user = User.objects.get(username=username)
        except User.DoesNotExist:
            user = None
        if user is not None:
            return render(request, 'register.html', {'errmsg': '用户名已存在'})

        # 业务处理, 用户注册
        user = User.objects.create_user(username, email, password)  # 在这里就已经存储到数据库了
        user.is_active = 1
        user.save()

        # 加密用户的身份信息, 生成激活的token
        serializer = Serializer(settings.SECRET_KEY, 3600)
        info = {'confirm': user.id}
        token = serializer.dumps(info)
        token = token.decode('utf-8')
        # 发送邮件
        # subject = '天天生鲜欢迎信息'
        #
        # message = '<h1>%s, 欢迎您成为天天生鲜用户</h1>请点击以下链接激活您的账户<br />' \
        #           '<a href="http://qjpd.xyz:8000/user/active/%s">http://qjpd.xyz:8000/user/active/%s</a>' % (
        #               username, token, token)
        # html_message = message
        # sender = '唐贤斌<txbhandsome564@163.com>'
        # receiver = [email]

        # send_mail(subject, message, sender, receiver, html_message=html_message)
        # send_register_active_email.delay(email, username, token)
        # 返回应答, 跳转到首页
        return redirect(reverse('user:index'))  # 注意不能有空格



class ActiveView(View):
    def get(self, request, token):
        # 进行解密, 获取要激活的user
        serializer = Serializer(settings.SECRET_KEY, 3600)
        try:
            info = serializer.loads(token)
            user_id = info['confirm']
            user = User.objects.get(id=user_id)
            user.is_active = 1
            user.save()
            # 跳转到登录页面
            return redirect(reverse('user:login'))
        except SignatureExpired as e:
            # 激活链接已经过期
            return HttpResponse('激活链接已过期')


    def post(self, request):
        ...


# user/login
class LoginView(View):
    def get(self, request):
        if 'username' in request.COOKIES:
            username = request.COOKIES.get('username')
            checked = 'checked'
        else:
            username = ''
            checked = ''
        return render(request, 'login.html', {'username': username, 'checked': checked})

    def post(self, request):
        # 接受数据
        username = request.POST.get('username')
        password = request.POST.get('pwd')

        if not all([username, password]):
            return render(request, 'login.html', {'errmsg': '数据不完整'})

        # user = User.objects.get(username=username, password=password)

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                # 用户已激活, 记录用户的状态, 获取用户登录后要跳转的url地址
                login(request, user)
                next_url = request.GET.get('next', reverse('user:user'))
                # None, 如果不是从用户登录required页面跳转的时候是None

                # 判断是否需要记住用户名
                response = redirect(next_url)  # HttpResponseRedirect
                remember = request.POST.get('remember')
                if remember == 'on':
                    response.set_cookie('username', username, max_age=7*24*3600)
                else:
                    response.delete_cookie('username')
                return response

            else:
                return render(request, 'login.html', {'errmsg': '用户未激活'})
        else:
            return render(request, 'login.html', {'errmsg': '用户名或密码错误'})


# user/logout
class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect(reverse('user:index'))


# /user
class UserInfoView(LoginRequiredMixin, View):
    """用户信息"""
    def get(self, request):
        # 获取用户的个人信息
        user = request.user
        address = Address.objects.get_default_address(user)
        # 获取用户的历史浏览记录, 每个用户有其独立的存储history的list
        con = get_redis_connection('default')
        history_key = 'history_%d' % user.id
        # 获取用户最新的浏览的前5个数据
        sku_ids = con.lrange(history_key, 0, 4)  # 拿到list中的前5条数据
        # 从数据库中查询用户浏览的商品的具体信息
        # goods_li = GoodsSKU.objects.filter(id__in=sku_ids)
        goods_li = []
        for id in sku_ids:
            goods = GoodsSKU.objects.get(id=id)
            goods_li.append(goods)
        # 组织上下文
        context = {
            'page': 'user',
            'address': address,
            'goods_li': goods_li,
        }

        return render(request, 'user_center_info.html', context)


# /user/order
class UserOrderView(LoginRequiredMixin, View):
    """用户订单"""
    def get(self, request, page):
        # 获取用户的订单信息
        user = request.user
        orders = OrderInfo.objects.filter(user=user).order_by('-create_time')
        # todo: 遍历取得订单的商品信息
        for order in orders:
            order_skus = OrderGoods.objects.filter(order_id=order.order_id)

            # 遍历计算order_skus计算商品的小计
            for order_sku in order_skus:
                amount = order_sku.count * order_sku.price
                order_sku.amount = amount
            order.order_skus = order_skus
            order.status_name = OrderInfo.ORDER_STATUS[order.order_status]
        # todo: 分页
        paginator = Paginator(orders, 1)
        try:
            page = int(page)
        except Exception as e:
            page = 1
        if page > paginator.num_pages:
            page = 1
        # 获取第page页的Page实例对象
        order_page = paginator.page(page)
        # todo: 页码显示, 页面上最多显示5个页码
        num_pages = paginator.num_pages
        if num_pages < 5:
            pages = range(1, num_pages+1)
        elif page <= 3:
            pages = range(1, 6)
        elif num_pages - page <= 2:
            pages = range(num_pages-4, num_pages+1)
        else:
            pages = range(page-2, page+3)
        context = {
            'page': 'order',
            'orders': orders,
            'order_page': order_page,
            'pages': pages,

        }
        return render(request, 'user_center_order.html', context)


# /user/address
class UserSiteView(LoginRequiredMixin, View):
    """用户订单地址"""
    def get(self, request):
        # 获取用户的默认收货地址

        # 业务处理: 地址添加, 只有为空时才添加默认地址
        user = request.user
        # try:
        #     address = Address.objects.get(user=user, is_default=True)
        # except Address.DoesNotExist:
        #     address = None
        address = Address.objects.get_default_address(user)

        return render(request, 'user_center_site.html', {'page': 'address', 'address': address})

    def post(self, request):
        """地址的添加"""
        receiver = request.POST.get('receiver')
        addr = request.POST.get('addr')
        zip_code = request.POST.get('zip_code')
        phone = request.POST.get('phone')
        is_default = None

        if not all([receiver, addr, phone]):
            return render(request, 'user_center_site.html', {'errmsg': '数据不完整'})
        if not re.match(r'1[3|4|5|7|8][0-9]{9}', phone):
            return render(request, 'user_center_site.html', {'errmsg': '手机格式不正确'})

        # 业务处理: 地址添加, 只有为空时才添加默认地址
        user = request.user
        # try:
        #     address = Address.objects.get(user=user, is_default=True)
        # except Address.DoesNotExist:
        #     address = None
        address = Address.objects.get_default_address(user)
        if address:
            is_default = False
        else:
            is_default = True

        Address.objects.create(user=user, receiver=receiver, addr=addr, zip_code=zip_code, phone=phone, is_default=is_default)
        return redirect(reverse('user:address'))