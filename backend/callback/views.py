from rest_framework import viewsets, permissions
from .models import CallbackRequest
from .serializers import CallbackRequestSerializer
from rest_framework.permissions import IsAuthenticatedOrReadOnly, AllowAny
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework_simplejwt.authentication import JWTAuthentication

class CallbackRequestViewSet(viewsets.ModelViewSet):
    queryset = CallbackRequest.objects.all().order_by('-created_at')
    serializer_class = CallbackRequestSerializer
    authentication_classes = [JWTAuthentication]

    def get_permissions(self):
        if self.action in ['create']:  # создание заявки — доступно всем
            return [AllowAny()]
        return [permissions.IsAuthenticated()]  # чтение, изменение, удаление — только с JWT
    
    def perform_create(self, serializer):
        instance = serializer.save()
        from .utils import send_telegram_message
        from django.conf import settings

        text = (
            "📞 Новая заявка:\n\n"
            f"Имя: {instance.name or '—'}\n"
            f"Телефон: {instance.phone_number}\n"
            f"Комментарий: {instance.comment or '—'}\n"
            f"Дата: {instance.created_at.strftime('%Y-%m-%d %H:%M')}"
        )

        send_telegram_message(text, settings.TELEGRAM_MANAGER_CHAT_ID)
