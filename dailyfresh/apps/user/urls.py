from django.conf.urls import url
from . import views
from apps.user.views import (
    RegisterView,
    ActiveView,
    LoginView,
    LogoutView,
    UserInfoView,
    UserOrderView,
    UserSiteView,
)
from django.contrib.auth.decorators import login_required


urlpatterns = [
    url(r'^register$', RegisterView.as_view(), name='register'),  # 用户注册
    url(r'^index$', views.index, name='index'),  # 用于测试
    url(r'^active/(?P<token>.*)$', ActiveView.as_view(), name='active'),  # 用户激活
    url(r'^login$', LoginView.as_view(), name='login'),  # 用户登录
    url(r'^$', login_required(UserInfoView.as_view()), name='user'),  # 用户中心信息页面
    url(r'^order/(?P<page>\d+)$', login_required(UserOrderView.as_view()), name='order'),  # 用户订单信息页面
    url(r'^address$', login_required(UserSiteView.as_view()), name='address'),  # 用户地址详情页面
    url(r'^logout$', LogoutView.as_view(), name='logout'),  # 用户退出登录

 ]