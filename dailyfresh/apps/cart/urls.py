from django.conf.urls import  url
from .views import CartAddView, CartInfoView, CartUpdateView, CartDeleteView


urlpatterns = [
    url(r'^add$', CartAddView.as_view(), name='add'),
    url(r'^$', CartInfoView.as_view(), name='show'),
    url(r'^update$', CartUpdateView.as_view(), name='update'),  # 更新购物车
    url(r'^delete$', CartDeleteView.as_view(), name='delete'),
]