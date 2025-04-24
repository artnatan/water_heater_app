
# 🔥 Water Heater App

A mobile-first web application to streamline customer support and callback requests for NovaTec water heaters.

![NovaTec Logo](assets/logo_novatec.svg)

---

## 📦 Project Structure

```
water_heater_app/
├── backend/     # Django + DRF (API server)
├── flutter/     # Flutter Web frontend
```

---

## 💡 Features

- 📞 One-tap call to service center
- ☎️ Callback request form with validation
- 💬 Contact service via Telegram or Viber
- 📩 Telegram notifications for operators
- 📱 Optimized mobile layout
- 🛠 Status handling (API-ready for CRM)

---

## 🚀 Technologies

| Stack        | Tech                            |
|--------------|----------------------------------|
| Frontend     | Flutter Web                     |
| Backend      | Django, Django REST Framework   |
| Messaging    | Telegram Bot API                |
| Hosting      | Render (backend), Netlify (frontend) |

---

## 🛠 Deployment

### 🔧 Backend (Django + pipenv)

> Located in: `backend/`

1. Install dependencies:
   ```bash
   pipenv install
   ```

2. Export `requirements.txt` for Render:
   ```bash
   pipenv lock --requirements > requirements.txt
   ```

3. `Procfile`:
   ```
   web: gunicorn water_heater_app.wsgi
   ```

4. Settings adjustments:
   ```python
   ALLOWED_HOSTS = ['*']
   CORS_ALLOW_ALL_ORIGINS = True
   ```

5. Push to GitHub → connect to [Render](https://render.com)
   - Set Root Directory: `backend`
   - Set Build Command: `pip install -r requirements.txt`
   - Set Start Command: `gunicorn water_heater_app.wsgi`

---

### 💻 Frontend (Flutter Web)

> Located in: `flutter/`

1. Build the web version:
   ```bash
   flutter build web
   ```

2. Upload contents of `flutter/build/web/` to [Netlify](https://netlify.com)

3. Update API base URL in `lib/services/api_config.dart`:
   ```dart
   const String baseUrl = 'https://your-backend.onrender.com';
   ```

---

## 🔗 Useful Links

- 🌐 [Frontend Live (Netlify)](https://your-project.netlify.app)
- 🧠 [Backend API (Render)](https://your-backend.onrender.com/api/callbacks/)
- 🤖 [Telegram Bot](https://t.me/GPromServiceBot)

---

## 📱 QR Code

Scan to open the application on mobile:

![QR Code](https://api.qrserver.com/v1/create-qr-code/?data=https://your-project.netlify.app&size=200x200)

---

## 👨‍💻 Author

Developed with ❤️ by [@artnatan](https://github.com/artnatan)
