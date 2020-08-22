from django.conf import settings

from rest_framework.pagination import PageNumberPagination


class AppPagination(PageNumberPagination):
    page_size_query_description = 'page_size'
    max_page_size = settings.MAX_PAGE_SIZE
