# 🚀 How to Run Your App

## Super Simple Setup (2 Minutes!)

### Step 1: Copy Your Firebase Info

Open `lib/firebase_config.dart` and replace these values from your `google-services.json`:

```dart
apiKey: 'YOUR_API_KEY',           // From: client > api_key > current_key
projectId: 'YOUR_PROJECT_ID',     // From: project_info > project_id
storageBucket: 'YOUR_BUCKET',     // From: project_info > storage_bucket
messagingSenderId: 'YOUR_ID',     // From: project_info > project_number
appId: 'YOUR_APP_ID',             // From: client > client_info > mobilesdk_app_id
```

**Example from your google-services.json:**
```json
{
  "project_info": {
    "project_number": "1055480638346",        ← messagingSenderId
    "project_id": "activity1-b8b8f",          ← projectId
    "storage_bucket": "activity1-b8b8f..."    ← storageBucket
  },
  "client": [{
    "client_info": {
      "mobilesdk_app_id": "1:1055480..."      ← appId
    },
    "api_key": [{
      "current_key": "AIzaSyC..."             ← apiKey
    }]
  }]
}
```

### Step 2: Enable Firestore

1. Go to https://console.firebase.google.com/
2. Select your project
3. Click **Firestore Database** → **Create Database**
4. Choose **"Start in test mode"**
5. Click **Enable**

### Step 3: Run the App

```bash
flutter run
```

Select your platform:
- **[1]** Windows (desktop)
- **[2]** Edge (web)

**That's it!** ✅

---

## What You Can Do

- ➕ Add employees (tap + button)
- 📋 View all employees
- ✏️ Edit employees (tap edit icon)
- 🗑️ Delete employees (tap delete icon)

## Troubleshooting

### White screen or errors?
1. Make sure you copied ALL values in `firebase_config.dart`
2. Make sure Firestore is enabled in Firebase Console
3. Run `flutter clean` then `flutter run`

### Still not working?
Check the browser console (F12) for error messages.

---

**Your values are already filled in! Just enable Firestore and run!** 🎉
