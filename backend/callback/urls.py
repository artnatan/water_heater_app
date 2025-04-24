from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import CallbackRequestViewSet

router = DefaultRouter()
router.register(r'callbacks', CallbackRequestViewSet, basename='callback')

urlpatterns = [
    path('', include(router.urls)),
]
