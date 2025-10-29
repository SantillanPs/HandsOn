# Firebase Setup Instructions

## ✅ You're Almost Ready!

Since you already have the `google-services.json` file, the app is configured and ready to run!

## Quick Setup (2 Steps Only!)

### 1. Enable Firestore in Firebase Console
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Navigate to **Firestore Database**
4. Click **Create Database**
5. Choose **Start in test mode** (for development)
6. Select a location for your database

### 2. Run the App
That's it! Just run:
```bash
flutter run
```

## Firestore Database Structure

The app will create a collection called `employees` with the following fields:
- **name** (String): Employee's full name
- **position** (String): Job position/title
- **status** (String): Employment status (e.g., Active, Inactive, On Leave)
- **agency** (String): Agency or department name

## Security Rules (Production)

For production, update your Firestore security rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /employees/{employeeId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## Troubleshooting

### Issue: "Firebase not initialized"
- Make sure you've run `flutterfire configure`
- Check that `firebase_options.dart` exists in your `lib` folder

### Issue: "Permission denied" when accessing Firestore
- Check your Firestore security rules
- Make sure you're in test mode during development

### Issue: Build errors on Android
- Make sure your `android/build.gradle` has `minSdkVersion` of at least 21
- Clean and rebuild: `flutter clean && flutter pub get`
