from django.contrib import admin
from .models import CallbackRequest

@admin.register(CallbackRequest)
class CallbackRequestAdmin(admin.ModelAdmin):
    list_display = ('phone_number', 'status', 'created_at')
    list_filter = ('status', 'created_at')
    search_fields = ('phone_number', 'name', 'comment')
