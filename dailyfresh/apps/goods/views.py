from django.shortcuts import render, redirect

from .models import (
    GoodsType,
    IndexTypeGoodsBanner,
    IndexPromotionBanner,
    IndexGoodsBanner,
    GoodsSKU,
)
from django_redis import get_redis_connection
from django.core.cache import cache
from django.views.generic import View
from django.core.urlresolvers import reverse
from apps.order.models import OrderGoods
from django.core.paginator import Paginator


# Create your views here.


class IndexView(View):
    def get(self, request):
        '''显示首页'''
        # 首先获取缓存中的内容
        context = cache.get('index_page_data')
        if context is None:
            # 商品种类
            types = GoodsType.objects.all()
            # 轮播图 index 决定轮播图的前后
            goods_banners = IndexGoodsBanner.objects.all().order_by('index')
            # 促销商品, index 决定促销商品的展示顺序
            promotion_banners = IndexPromotionBanner.objects.all().order_by('index')

            for type in types:
                # 获取type种类首页分类商品的图片展示信息
                image_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=1).order_by('index')
                # 获取type种类首页分类商品的文字展示信息
                title_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=0).order_by('index')

                # 动态给type增加属性, 分别保存在首页分类商品的图片展示信息和文字展示信息
                type.image_banners = image_banners
                type.title_banners = title_banners
                # 组织模板上下文
            context = {
                'types': types,
                'goods_banners': goods_banners,
                'promotion_banners': promotion_banners,
            }
            # 设置缓存(key, value, timeout)
            cache.set('index_page_data', context, 3600)
        else:
            pass

        user = request.user
        cart_count = 0
        if user.is_authenticated():
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            cart_count = conn.hlen(cart_key)
        context.update(cart_count=cart_count)
        return render(request, 'index.html', context)


class DetailView(View):
    '''详情页'''
    def get(self, request, goods_id):
        '''显示详情页'''
        try:
            sku = GoodsSKU.objects.get(id=goods_id)
        except GoodsSKU.DoesNotExist:
            return redirect(reverse('goods:index'))

        types = GoodsType.objects.all()
        sku_orders = OrderGoods.objects.filter(sku=sku).exclude(comment='')  # 过滤掉comment为空的评论
        new_skus = GoodsSKU.objects.filter(type=sku.type).order_by('create_time')[:2]
        # 获取同一个SPU的其他规格商品
        same_spu_skus = GoodsSKU.objects.filter(goods=sku.goods).exclude(id=goods_id)

        user = request.user
        cart_count = 0
        if user.is_authenticated():
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            cart_count = conn.hlen(cart_key)
            history_key = 'history_%d' * user.id
            conn.lrem(history_key, 0, goods_id)
            conn.lpush(history_key, goods_id)
            conn.ltrim(history_key, 0, 4)

        context = {
            'sku': sku,
            'types': types,
            'sku_orders': sku_orders,
            'new_skus': new_skus,
            'cart_count': cart_count,
            'same_spu_skus': same_spu_skus
        }
        return render(request, 'detail.html', context)


class ListView(View):
    '''商品list'''
    def get(self, request, type_id, page):
        try:
            type = GoodsType.objects.get(id=type_id)
        except GoodsType.DoesNotExist:
            # 种类不存在
            return redirect(reverse('goods:index'))
        types = GoodsType.objects.all()
        sort = request.GET.get('sort')
        if sort == 'price':
            skus = GoodsSKU.objects.filter(type=type).order_by('price')
        elif sort == 'hot':
            skus = GoodsSKU.objects.filter(type=type).order_by('-sales')
        else:
            sort = 'default'
            skus = GoodsSKU.objects.filter(type=type).order_by('-id')

        paginator = Paginator(skus, 1)
        # 获取page也的内容
        try:
            page = int(page)
        except Exception as e:
            page = 1
        if page > paginator.num_pages:
            page = 1
        # 获取第page页的对象内容
        skus_page = paginator.page(page)
        # 获取新品信息
        new_skus = GoodsSKU.objects.filter(type=type).order_by('create_time')[:2]
        # 购物车
        user = request.user
        cart_count = 0
        if user.is_authenticated():
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            cart_count = conn.hlen(cart_key)




        context = {
            'type': type,
            'types': types,
            'new_skus': new_skus,
            'skus_page': skus_page,
            'cart_count': cart_count,
            'sort': sort,
        }
        return render(request, 'list.html', context)



