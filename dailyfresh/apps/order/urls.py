from django.conf.urls import url
from apps.order.views import OrderPlaceView, OrderCommitView, OrderPayView, CommentView
urlpatterns = [
    url(r'^place$', OrderPlaceView.as_view(), name='place'),  # 处理用户提交的订单请求
    url(r'^commit$', OrderCommitView.as_view(), name='commit'),  # 处理提交的订单
    url(r'^pay$', OrderPayView.as_view(), name='pay'),  # 支付
    url(r'^comment/(?P<order_id>\d+)$', CommentView.as_view(), name='comment'),  # 评论

]

