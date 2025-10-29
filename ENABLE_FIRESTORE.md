# 🔥 Enable Firestore Database

## Your app is working! Just need to enable Firestore.

### Quick Steps (2 minutes):

1. **Go to Firebase Console:**
   https://console.firebase.google.com/

2. **Select your project:**
   Click on **activity1-b8b8f**

3. **Create Firestore Database:**
   - Click **"Firestore Database"** in the left menu
   - Click **"Create Database"** button
   - Select **"Start in test mode"** ← IMPORTANT!
   - Choose any location (closest to you)
   - Click **"Enable"**

4. **Done!**
   Go back to your app and refresh (press 'r' in terminal or restart)

---

## Why Test Mode?

Test mode allows read/write access without authentication - perfect for development!

**Test Mode Rules (automatically applied):**
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.time < timestamp.date(2025, 2, 1);
    }
  }
}
```

This allows all access until the expiration date.

---

## After Enabling Firestore

Your app will immediately work! You can:
- ➕ Add employees
- 📋 View all employees  
- ✏️ Edit employees
- 🗑️ Delete employees

All data syncs in real-time! 🎉

---

**Just enable Firestore in test mode and you're done!**
