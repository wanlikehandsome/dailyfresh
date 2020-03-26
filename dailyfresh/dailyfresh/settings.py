"""
Django settings for dailyfresh project.

Generated by 'django-admin startproject' using Django 1.8.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.8/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
# import sys


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# 在Python编译器的搜索路径中增加一条
# sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'l2#%q307)jj_+qxw)qvpx@)^m^2qtysyw6d31^rn-%36@*!(f6'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = [*]


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'tinymce',
    'apps.user',  # 用户模块
    'apps.order',  # 订单模块
    'apps.cart',  # 购物车模块
    'apps.goods',  # 商品模块

)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
)

ROOT_URLCONF = 'dailyfresh.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'dailyfresh.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'dailyfresh',
        'USER': 'root',
        'PASSWORD': 's2017211914',
        'HOST': 'localhost',
        'PORT': 3306,
    }
}

# 指定django认证系统使用的模型类
AUTH_USER_MODEL = 'user.User'
# 默认会有一个默认的auth_user表, 怕混淆就必须指定自己的模型类
#

# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

STATIC_URL = '/static/'  # 为了前端书写方便
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static')]  # 为了找到静态文件

# 富文本编辑器配置
TINYMCE_DEFAULT_CONFIG = {
    'theme': 'advanced',
    'width': 600,
    'height': 400,
}

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# smtp服务器地址
EMAIL_HOST = 'smtp.163.com'
EMAIL_PORT = 25
EMAIL_HOST_USER = 'txbhandsome564@163.com'
EMAIL_HOST_PASSWORD = 'txbhandsome564'
EMAIL_FROM = '唐贤斌<txbhandsome564@163.com>'


# django 的缓存配置
CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': 'redis://111.230.22.105/9',
        'DPTIONS': {
            'CLIENT_CLASS': 'django_redis.client.DefaultClient',
        }
    }
}
# 配置session存储
SESSION_ENGINE = 'django.contrib.sessions.backends.cache'
SESSION_CACHE_ALIAS = 'default'

# 配置未登录用户的跳转路径
LOGIN_URL = '/user/login'

# 配置django的文件存储类
# DEFAULT_FILE_STORAGE = './utils.fdfs.storage.FDFSStorage'
MEDIA_ROOT = os.path.join(BASE_DIR, 'static/media')

# FastDFS config配置: 使用的client.conf路径
FDFS_CLIENT_CONF = './utils/fdfs/client.conf'
# 设置fdfs存储服务器的nginx的ip和端口
FDFS_URL = 'nginx的ip' + 'nginx的port'


HAYSTACK_CONNECTIONS = {
    'default': {
        # 在django-haystack中使用whoosh搜索引擎
        'ENGINE': 'haystack.backends.whoosh_backend.WhooshEngine',
        # 配置生成的索引文件路径
        'PATH': os.path.join(BASE_DIR, 'whoosh_index')
    }
}

# 当添加修改删除数据时, 自动改动索引
HAYSTACK_SIGNAL_PROCESSOR = 'haystack.signals.RealtimeSignalProcessor'
# 指定索引后的数据的分页
HAYSTACK_SEARCH_RESULTS_PER_PAGE=1
