from django.contrib.auth.decorators import login_required


class LoginRequiredMixin(object):
    @classmethod
    def as_view(cls, **initkwargs):
        view = super(LoginRequiredMixin, cls).as_view(**initkwargs)
        # 调用 View里面的 as_view方法
        # 可以用LoginRequiredMixin.__mro__查看类的排列顺序, 因此是调用LoginRequiredMixin后面的类的方法了
        return login_required(view)

