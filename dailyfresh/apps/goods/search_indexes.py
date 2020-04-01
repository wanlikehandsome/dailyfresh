from haystack import indexes
from .models import GoodsSKU


class GoodsSKUIndex(indexes.SearchIndex, indexes.Indexable):
    # 是否索引字段, 索引字段是否使用模板, 根据哪些字段建立索引文件
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        # 返回索引使用的工具类
        return GoodsSKU

    def index_queryset(self, using=None):
        return self.get_model().objects.all()