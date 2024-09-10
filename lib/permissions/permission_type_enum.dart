enum PermissionType {
  camera,
  location,
  sms,
  storage,
  phone,
  contacts,
  locationAlways,
  locationWhenInUse,
  mediaLibrary,
  microphone,
  photos,
  photosAddonly,
  reminders,
  sensors,
  speech,
  ignoreBatteryOptimization,
  notification,
  accessMediaLocation,
  activityRecognition,
  bluetooth,
  manageExternalStorage,
  systemAlertWindow,
  requestInstallPackages,
  appTrackingTransparency,
  accessNotificationPolicy,
  bluetoothScan,
  bluetoothAdvertise,
  bluetoothConnect,
  nearbyWifiDevices,
  videos,
  audio,
  scheduleExactAlarm,
  sensorsAlways,
  calendarWriteOnly,
  calendarFullAccess,
  backgroundRefresh
}

extension PermissionTypeExtension on PermissionType {
  // Convert enum to string
  String enumToString() {
    return this.toString().split('.').last;
  }

  // Convert string to enum
  static PermissionType stringToEnum(String value) {
    return PermissionType.values.firstWhere(
      (e) => e.toString().split('.').last.toUpperCase() == value.toUpperCase(),
      orElse: () => throw ArgumentError('Invalid permission type: $value'),
    );
  }
}
