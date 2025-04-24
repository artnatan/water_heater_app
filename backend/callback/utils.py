import requests
from django.conf import settings

def send_telegram_message(text, chat_id):
    token = settings.TELEGRAM_BOT_TOKEN
    url = f"https://api.telegram.org/bot{token}/sendMessage"
    try:
        requests.post(url, data={
            'chat_id': chat_id,
            'text': text
        })
    except Exception as e:
        print("Ошибка отправки Telegram:", e)