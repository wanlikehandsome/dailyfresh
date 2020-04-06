from django.conf.urls import include, url
from django.contrib import admin
from django.views.generic.base import RedirectView

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^tinymce/', include('tinymce.urls')),  # 富文本编辑器
    url(r'^search/', include('haystack.urls')),  # 搜索引擎
    url(r'^user/', include('apps.user.urls', namespace='user')),
    url(r'^cart/', include('apps.cart.urls', namespace='cart')),
    url(r'^order/', include('apps.order.urls', namespace='order')),
    url(r'^favicon.ico$', RedirectView.as_view(url=r'static/favicon.ico')),
    url(r'^', include('apps.goods.urls', namespace='goods')),  # 按顺序匹配
]
