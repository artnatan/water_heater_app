from django.db import models

class CallbackRequest(models.Model):
    STATUS_CHOICES = [
        ('pending', 'Ожидает звонка'),
        ('in_progress', 'В процессе'),
        ('completed', 'Завершена'),
    ]

    phone_number = models.CharField(max_length=20)
    name = models.CharField(max_length=100, blank=True, null=True)
    comment = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.phone_number} ({self.status})"
