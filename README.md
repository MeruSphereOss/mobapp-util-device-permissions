# Mobile App - Device Permissions

These permissions enable apps to use functionalities such as the camera, microphone, contacts, text messages, and media files.

## User Can Pass the Following Permissions

- Camera
- Location
- SMS
- Phone

Before passing the permission list, the user must ensure the corresponding permissions are added to the Manifest file (for Android) or the Info.plist (for iOS).

#### Manifest:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.app">
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.READ_SMS" />
    <uses-permission android:name="android.permission.CALL_PHONE" />
</manifest>
