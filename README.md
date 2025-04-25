## 🔧 Water Heater App

A simple web app to help users quickly connect with NovaTec service. Users can request a callback, make a direct call, or contact support via messengers.

---

### 🚀 Live Link
**[https://service-nova.netlify.app](https://service-nova.netlify.app)**

![QR Code](https://raw.githubusercontent.com/artnatan/water_heater_app/main/flutter/assets/qr-code.png)

---

### 🛠 Technologies

- **Frontend**: Flutter (Web)
- **Backend**: Django + Django REST Framework
- **Messaging**: Telegram Bot API
- **Database**: SQLite or PostgreSQL
- **CI/Hosting**:
  - [Render](https://render.com) — backend
  - [Netlify](https://netlify.com) — frontend

---

### 📱 Features

- 🔔 Request a callback
- 📞 One-click call to service
- 💬 Messenger options (Telegram, Viber)
- 📲 QR code for quick mobile access

---

### 🧰 Local Setup

#### Backend
```bash
cd backend
pipenv install
pipenv run python manage.py migrate
pipenv run python manage.py runserver
```

#### Frontend
```bash
cd flutter
flutter pub get
flutter run -d chrome
```

---

### 🔐 Telegram Notifications
When a callback request is submitted:
- The user receives a confirmation
- The operator receives a message with details

---

### 📂 Project Structure
```
water_heater_app/
├── backend/        # Django backend
├── flutter/        # Flutter frontend
├── README.md
└── qr-code.png     # QR code for mobile access
```

---

### © 2025 Artem Natalchishin
