from django.urls import include, path
from django.contrib import admin

app_name = 'api_v1'
urlpatterns = [
    path('admin/', admin.site.urls),
    path('healthchecks/', include('django_healthchecks.urls')),
]
