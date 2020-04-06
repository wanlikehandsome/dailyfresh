# 使用celery
from celery import Celery
from django.conf import settings
from django.core.mail import send_mail


import os
import django
from apps.goods.models import GoodsType, IndexGoodsBanner, IndexPromotionBanner, IndexTypeGoodsBanner
from django_redis import get_redis_connection
from django.template import loader, RequestContext

# django 初始化
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "dailyfresh.settings")
django.setup()

# 出纳兼一个Celery实例对象
app = Celery('celery_tasks.tasks', broker='redis://127.0.0.1:6379/8')

# 定义任务函数
@app.task
def send_register_active_email(to_email, username, token):
    # 发送激活邮件, 包含激活连接, 激活链接中包含用户信息, 链接中的信息加密
    subject = '天天生鲜欢迎信息'

    message = '<h1>%s, 欢迎您成为天天生鲜用户</h1>请点击以下链接激活您的账户<br />' \
              '<a href="http://127.0.0.1:8000/user/active/%s">http://127.0.0.1:8000/user/active/%s</a>' % (
              username, token, token)
    html_message = message
    sender = settings.EMAIL_FROM
    receiver = [to_email]

    send_mail(subject, message, sender, receiver, html_message=html_message)

@app.task
def generate_static_index_html(request):
    """产生首页生成的静态页面"""
    # 获取商品的种类信息
    types = GoodsType.objects.all().order_by('index')
    # 获取首页的轮播商品信息
    promotion_banners = IndexPromotionBanner.objects.all().order_by('index')

    # 获取首页分类商品的展示信息
    for type in types:
        # 获取type种类首页分类商品的图片展示信息
        image_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=1)
        # 获取type种类首页分类商品的文字展示信息
        title_banners = IndexTypeGoodsBanner.objects.filter(type=type, diaplay_type=0)

        # 动态给type增加属性, 分别保存在首页分类商品的图片展示信息和文字展示信息
        type.image_banners = image_banners
        type.title_banners = title_banners
    user = request.user
    cart_count = 0
    # if user.is_authenticated():
    #     conn = get_redis_connection('default')
    #     cart_key = 'cart_%d' % user.id
    #     cart_count = conn.hlen(cart_key)

    # 组织模板上下文
    context = {
        'types': types,
        'goods_banners': goods_banners,
        'promotion_banners': promotion_banners,
        # 'cart_count': cart_count
    }
    temp = loader.get_template('static_index.html')
    # context = RequestContext(request, context)
    static_index_html = temp.render(context)

    save_path = os.path.join(settings.BASE_DIR, 'static/index.html')
    with open(save_path, 'w') as f:
        f.write(static_index_html)









