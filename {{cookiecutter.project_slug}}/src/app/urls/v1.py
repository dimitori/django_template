from django.contrib import admin
from django.urls import include, path

app_name = 'api_v1'
urlpatterns = [
    path('admin/', admin.site.urls),
    path('users/', include('users.urls')),
    path('healthchecks/', include('django_healthchecks.urls')),
]
