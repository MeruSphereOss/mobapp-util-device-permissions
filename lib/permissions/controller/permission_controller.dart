import 'package:mobapp_util_device_permissions/permission_constants.dart';
import 'package:mobapp_util_device_permissions/permissions/all_permission_status.dart';
import 'package:mobapp_util_device_permissions/permissions/permission_type_enum.dart';
import 'package:mobx/mobx.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';
part 'permission_controller.g.dart';

class PermissionController = PermissionControllerBase
    with _$PermissionController;

abstract class PermissionControllerBase with Store {
  @observable
  PermissionStatus cameraStatus = PermissionStatus.denied;

  @observable
  PermissionStatus locationStatus = PermissionStatus.denied;

  @observable
  PermissionStatus smsStatus = PermissionStatus.denied;

  @observable
  PermissionStatus phoneStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus storageStatus = PermissionStatus.denied;

  //Deprecated
  // @observable
  // PermissionStatus calendarStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus contactsStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus locationAlwaysStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus locationWhenInUseStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus mediaLibraryStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus microPhoneStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus photosStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus photosAddOnlyStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus remindersStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus sensorsStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus speechStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus ignoreBatteryOptimizationStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus notificationStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus accessMediaLocationStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus activityRecognitionStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus bluetoothStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus manageExternalStorageStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus systemAlertWindowStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus requestInstallPackagesStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus appTrackingTransparencyStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus accessNotificationPolicyStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus bluetoothScanStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus bluetoothAdvertiseStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus bluetoothConnectStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus nearbyWifiDevicesStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus videosStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus audioStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus scheduleExactAlarmStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus sensorsAlwaysStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus calendarWriteOnlyStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus calendarFullAccessStatus = PermissionStatus.denied;

  // @observable
  // PermissionStatus backgroundRefreshStatus = PermissionStatus.denied;

  @observable
  String allPermissionStatus = AllPermissionsStatus.ALL_PERMISSIONS_DENIED;

  @action
  Future<PermissionStatus> requestCameraPermission() async {
    await Permission.camera.request();
    cameraStatus = await Permission.camera.status;
    // print("camera:${cameraStatus}");
    return cameraStatus;
  }

  @action
  Future<PermissionStatus> requestLocationPermission() async {
    await Permission.location.request();
    locationStatus = await Permission.location.status;
    // print("location:${locationStatus}");
    return locationStatus;
  }

  @action
  Future<PermissionStatus> requestSmsPermission() async {
    await Permission.sms.request();
    smsStatus = await Permission.sms.status;
    // print("sms:${smsStatus}");
    return smsStatus;
  }

  @action
  Future<PermissionStatus> requestPhonePermission() async {
    await Permission.phone.request();
    phoneStatus = await Permission.phone.status;
    // print("phone:${phoneStatus}");
    return phoneStatus;
  }

  // @action
  // Future<PermissionStatus> requestStoragePermission() async {
  //   await Permission.storage.request();
  //   storageStatus = await Permission.storage.status;
  //   // print("Storage:${storageStatus}");
  //   return storageStatus;
  // }

  // @action
  // Future<PermissionStatus> requestCalendarPermission() async {
  //   await Permission.calendar.request();
  //   calendarStatus = await Permission.calendar.status;
  // print("calendarStatus:${calendarStatus}");
  //   return calendarStatus;
  // }

  // @action
  // Future<PermissionStatus> requestContactsPermission() async {
  //   await Permission.contacts.request();
  //   contactsStatus = await Permission.contacts.status;
  //   // print("contactsStatus:${contactsStatus}");
  //   return contactsStatus;
  // }

  // @action
  // Future<PermissionStatus> requestLocationAlwaysPermission() async {
  //   await Permission.locationAlways.request();
  //   locationAlwaysStatus = await Permission.locationAlways.status;
  //   // print("locationAlwaysStatus:${locationAlwaysStatus}");
  //   return locationAlwaysStatus;
  // }

  // @action
  // Future<PermissionStatus> requestLocationWhenInUsePermission() async {
  //   await Permission.locationWhenInUse.request();
  //   locationWhenInUseStatus = await Permission.locationWhenInUse.status;
  //   // print("locationWhenInUseStatus:${locationWhenInUseStatus}");
  //   return locationWhenInUseStatus;
  // }

  // @action
  // Future<PermissionStatus> requestMediaLibraryPermission() async {
  //   await Permission.mediaLibrary.request();
  //   mediaLibraryStatus = await Permission.mediaLibrary.status;
  //   // print("mediaLibraryStatus:${mediaLibraryStatus}");
  //   return mediaLibraryStatus;
  // }

  // @action
  // Future<PermissionStatus> requestMicrophonePermission() async {
  //   await Permission.microphone.request();
  //   microPhoneStatus = await Permission.microphone.status;
  //   // print("microPhoneStatus:${microPhoneStatus}");
  //   return microPhoneStatus;
  // }

  // @action
  // Future<PermissionStatus> requestPhotosPermission() async {
  //   await Permission.photos.request();
  //   photosStatus = await Permission.photos.status;
  //   // print("photosStatus:${photosStatus}");
  //   return photosStatus;
  // }

  // @action
  // Future<PermissionStatus> requestPhotosAddOnlyPermission() async {
  //   await Permission.photosAddOnly.request();
  //   photosAddOnlyStatus = await Permission.photosAddOnly.status;
  //   // print("photosAddOnlyStatus:${photosAddOnlyStatus}");
  //   return photosAddOnlyStatus;
  // }

  // @action
  // Future<PermissionStatus> requestRemindersPermission() async {
  //   await Permission.reminders.request();
  //   remindersStatus = await Permission.reminders.status;
  //   // print("remindersStatus:${remindersStatus}");
  //   return remindersStatus;
  // }

  // @action
  // Future<PermissionStatus> requestSensorsPermission() async {
  //   await Permission.sensors.request();
  //   sensorsStatus = await Permission.sensors.status;
  //   // print("sensorsStatus:${sensorsStatus}");
  //   return sensorsStatus;
  // }

  // @action
  // Future<PermissionStatus> requestSpeechPermission() async {
  //   await Permission.speech.request();
  //   speechStatus = await Permission.speech.status;
  //   // print("speechStatus:${speechStatus}");
  //   return speechStatus;
  // }

  // @action
  // Future<PermissionStatus> requestIgnoreBatteryOptimizationsPermission() async {
  //   await Permission.ignoreBatteryOptimizations.request();
  //   ignoreBatteryOptimizationStatus =
  //       await Permission.ignoreBatteryOptimizations.status;
  //   // print("ignoreBatteryOptimizationStatus:${ignoreBatteryOptimizationStatus}");
  //   return ignoreBatteryOptimizationStatus;
  // }

  // @action
  // Future<PermissionStatus> requestNotificationPermission() async {
  //   await Permission.notification.request();
  //   notificationStatus = await Permission.notification.status;
  //   // print("notificationStatus:${notificationStatus}");
  //   return notificationStatus;
  // }

  // @action
  // Future<PermissionStatus> requestAccessMediaLocationPermission() async {
  //   await Permission.accessMediaLocation.request();
  //   accessMediaLocationStatus = await Permission.accessMediaLocation.status;
  //   // print("accessMediaLocationStatus:${accessMediaLocationStatus}");
  //   return accessMediaLocationStatus;
  // }

  // @action
  // Future<PermissionStatus> requestActivityRecognitionPermission() async {
  //   await Permission.activityRecognition.request();
  //   activityRecognitionStatus = await Permission.activityRecognition.status;
  //   // print("activityRecognitionStatus:${activityRecognitionStatus}");
  //   return activityRecognitionStatus;
  // }

  // @action
  // Future<PermissionStatus> requestBluetoothPermission() async {
  //   await Permission.bluetooth.request();
  //   bluetoothStatus = await Permission.bluetooth.status;
  //   // print("bluetoothStatus:${bluetoothStatus}");
  //   return bluetoothStatus;
  // }

  // @action
  // Future<PermissionStatus> requestManageExternalStoragePermission() async {
  //   await Permission.manageExternalStorage.request();
  //   manageExternalStorageStatus = await Permission.manageExternalStorage.status;
  //   // print("manageExternalStorageStatus:${manageExternalStorageStatus}");
  //   return manageExternalStorageStatus;
  // }

  // @action
  // Future<PermissionStatus> requestSystemAlertWindowPermission() async {
  //   await Permission.systemAlertWindow.request();
  //   systemAlertWindowStatus = await Permission.systemAlertWindow.status;
  //   // print("systemAlertWindowStatus:${systemAlertWindowStatus}");
  //   return systemAlertWindowStatus;
  // }

  // @action
  // Future<PermissionStatus> requestRequestInstallPackagesPermission() async {
  //   await Permission.requestInstallPackages.request();
  //   requestInstallPackagesStatus =
  //       await Permission.requestInstallPackages.status;
  //   // print("requestInstallPackagesStatus:${requestInstallPackagesStatus}");
  //   return requestInstallPackagesStatus;
  // }

  // @action
  // Future<PermissionStatus> requestAppTrackingTransparencyPermission() async {
  //   await Permission.appTrackingTransparency.request();
  //   appTrackingTransparencyStatus =
  //       await Permission.appTrackingTransparency.status;
  //   // print("appTrackingTransparencyStatus:${appTrackingTransparencyStatus}");
  //   return appTrackingTransparencyStatus;
  // }

  // @action
  // Future<PermissionStatus> requestAccessNotificationPolicyPermission() async {
  //   await Permission.accessNotificationPolicy.request();
  //   accessNotificationPolicyStatus =
  //       await Permission.accessNotificationPolicy.status;
  //   // print("accessNotificationPolicyStatus:${accessNotificationPolicyStatus}");
  //   return accessNotificationPolicyStatus;
  // }

  // @action
  // Future<PermissionStatus> requestBluetoothScanPermission() async {
  //   await Permission.bluetoothScan.request();
  //   bluetoothScanStatus = await Permission.bluetoothScan.status;
  //   // print("bluetoothScanStatus:${bluetoothScanStatus}");
  //   return bluetoothScanStatus;
  // }

  // @action
  // Future<PermissionStatus> requestBluetoothAdvertisePermission() async {
  //   await Permission.bluetoothAdvertise.request();
  //   bluetoothAdvertiseStatus = await Permission.bluetoothAdvertise.status;
  //   // print("bluetoothAdvertiseStatus:${bluetoothAdvertiseStatus}");
  //   return bluetoothAdvertiseStatus;
  // }

  // @action
  // Future<PermissionStatus> requestBluetoothConnectPermission() async {
  //   await Permission.bluetoothConnect.request();
  //   bluetoothConnectStatus = await Permission.bluetoothConnect.status;
  //   // print("bluetoothConnectStatus:${bluetoothConnectStatus}");
  //   return bluetoothConnectStatus;
  // }

  // @action
  // Future<PermissionStatus> requestNearbywifiDevicesPermission() async {
  //   await Permission.nearbyWifiDevices.request();
  //   nearbyWifiDevicesStatus = await Permission.nearbyWifiDevices.status;
  //   // print("nearbyWifiDevicesStatus:${nearbyWifiDevicesStatus}");
  //   return nearbyWifiDevicesStatus;
  // }

  // @action
  // Future<PermissionStatus> requestVideosPermission() async {
  //   await Permission.videos.request();
  //   videosStatus = await Permission.videos.status;
  //   // print("videosStatus:${videosStatus}");
  //   return videosStatus;
  // }

  // @action
  // Future<PermissionStatus> requestAudioPermission() async {
  //   await Permission.audio.request();
  //   audioStatus = await Permission.audio.status;
  //   // print("audioStatus:${audioStatus}");
  //   return audioStatus;
  // }

  // @action
  // Future<PermissionStatus> requestScheduleExactAlarmPermission() async {
  //   await Permission.scheduleExactAlarm.request();
  //   scheduleExactAlarmStatus = await Permission.scheduleExactAlarm.status;
  //   // print("scheduleExactAlarmStatus:${scheduleExactAlarmStatus}");
  //   return scheduleExactAlarmStatus;
  // }

  // @action
  // Future<PermissionStatus> requestSensorsAlwaysPermission() async {
  //   await Permission.sensorsAlways.request();
  //   sensorsAlwaysStatus = await Permission.sensorsAlways.status;
  //   // print("sensorsAlwaysStatus:${sensorsAlwaysStatus}");
  //   return sensorsAlwaysStatus;
  // }

  // @action
  // Future<PermissionStatus> requestCalendarWriteOnlyPermission() async {
  //   await Permission.calendarWriteOnly.request();
  //   calendarWriteOnlyStatus = await Permission.calendarWriteOnly.status;
  //   // print("calendarWriteOnlyStatus:${calendarWriteOnlyStatus}");
  //   return calendarWriteOnlyStatus;
  // }

  // @action
  // Future<PermissionStatus> requestCalendarFullAccessPermission() async {
  //   await Permission.calendarFullAccess.request();
  //   calendarFullAccessStatus = await Permission.calendarFullAccess.status;
  //   // print("calendarFullAccessStatus:${calendarFullAccessStatus}");
  //   return calendarFullAccessStatus;
  // }

  // @action
  // Future<PermissionStatus> requestBackgroundRefreshPermission() async {
  //   await Permission.backgroundRefresh.request();
  //   backgroundRefreshStatus = await Permission.backgroundRefresh.status;
  //   // print("backgroundRefreshStatus:${backgroundRefreshStatus}");
  //   return backgroundRefreshStatus;
  // }

  String permissionStatusName(PermissionStatus permissionStatus) {
    try {
      if (permissionStatus.isGranted) {
        return GRANTED;
      } else if (permissionStatus.isDenied) {
        return DENIED;
      } else if (permissionStatus.isPermanentlyDenied) {
        return PERMANENTLY_DENIED;
      } else if (permissionStatus.isRestricted) {
        return RESTRICTED;
      } else {
        return LIMITED;
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> updatePermissionStatus(
      List<PermissionType> requestedPermissions) async {
    cameraStatus = await Permission.camera.status;
    locationStatus = await Permission.location.status;
    smsStatus = await Permission.sms.status;
    phoneStatus = await Permission.phone.status;
    // contactsStatus = await Permission.contacts.status;
    // locationAlwaysStatus = await Permission.locationAlways.status;
    // locationWhenInUseStatus = await Permission.locationWhenInUse.status;
    // mediaLibraryStatus = await Permission.mediaLibrary.status;
    // microPhoneStatus = await Permission.microphone.status;
    // photosStatus = await Permission.photos.status;
    // photosAddOnlyStatus = await Permission.photosAddOnly.status;
    // remindersStatus = await Permission.reminders.status;
    // sensorsStatus = await Permission.sensors.status;
    // speechStatus = await Permission.speech.status;
    // storageStatus = await Permission.storage.status;
    // ignoreBatteryOptimizationStatus =
    //     await Permission.ignoreBatteryOptimizations.status;
    // notificationStatus = await Permission.notification.status;
    // accessMediaLocationStatus = await Permission.accessMediaLocation.status;
    // activityRecognitionStatus = await Permission.activityRecognition.status;
    // bluetoothStatus = await Permission.bluetooth.status;
    // manageExternalStorageStatus = await Permission.manageExternalStorage.status;
    // systemAlertWindowStatus = await Permission.systemAlertWindow.status;
    // requestInstallPackagesStatus =
    //     await Permission.requestInstallPackages.status;
    // appTrackingTransparencyStatus =
    //     await Permission.appTrackingTransparency.status;
    // accessNotificationPolicyStatus =
    //     await Permission.accessNotificationPolicy.status;
    // bluetoothScanStatus = await Permission.bluetoothScan.status;
    // bluetoothAdvertiseStatus = await Permission.bluetoothAdvertise.status;
    // bluetoothConnectStatus = await Permission.bluetoothConnect.status;
    // nearbyWifiDevicesStatus = await Permission.nearbyWifiDevices.status;
    // videosStatus = await Permission.videos.status;
    // audioStatus = await Permission.audio.status;
    // scheduleExactAlarmStatus = await Permission.scheduleExactAlarm.status;
    // sensorsAlwaysStatus = await Permission.sensorsAlways.status;
    // calendarWriteOnlyStatus = await Permission.calendarWriteOnly.status;
    // calendarFullAccessStatus = await Permission.calendarFullAccess.status;
    // backgroundRefreshStatus = await Permission.backgroundRefresh.status;

    checkAnyPermissionDenied(requestedPermissions);
  }

  // @action
  // Future<void> checkAnyPermissionDenied() async {
  //   await updatePermissionStatus();
  //   if (!isIOS) {
  //     if (cameraStatus == PermissionStatus.granted &&
  //             locationStatus == PermissionStatus.granted
  //         // &&
  //         // smsStatus == PermissionStatus.granted &&
  //         // phoneStatus == PermissionStatus.granted
  //         ) {
  //       allPermissionStatus = AllPermissionsStatus.ALL_PERMISSIONS_GRANTED;
  //     } else if (cameraStatus == PermissionStatus.denied &&
  //             locationStatus == PermissionStatus.denied
  //         // &&
  //         // smsStatus == PermissionStatus.denied &&
  //         // phoneStatus == PermissionStatus.denied
  //         ) {
  //       allPermissionStatus = AllPermissionsStatus.ALL_PERMISSIONS_DENIED;
  //     } else if (cameraStatus == PermissionStatus.permanentlyDenied &&
  //             locationStatus == PermissionStatus.permanentlyDenied
  //         // &&
  //         // smsStatus == PermissionStatus.permanentlyDenied &&
  //         // phoneStatus == PermissionStatus.permanentlyDenied
  //         ) {
  //       allPermissionStatus =
  //           AllPermissionsStatus.ALL_PERMISSIONS_PERMANENTLY_DENIED;
  //     } else if (cameraStatus == PermissionStatus.denied ||
  //             locationStatus == PermissionStatus.denied
  //         // ||
  //         // smsStatus == PermissionStatus.denied ||
  //         // phoneStatus == PermissionStatus.denied
  //         ) {
  //       // print("Aamani");
  //       allPermissionStatus = AllPermissionsStatus.SOME_PERMISSIONS_DENIED;
  //     } else if (cameraStatus == PermissionStatus.permanentlyDenied ||
  //             locationStatus == PermissionStatus.permanentlyDenied
  //         // ||
  //         // smsStatus == PermissionStatus.permanentlyDenied ||
  //         // phoneStatus == PermissionStatus.permanentlyDenied
  //         ) {
  //       // print("Inside...");
  //       allPermissionStatus =
  //           AllPermissionsStatus.SOME_PERMISSIONS_PERMANENTLY_DENIED;
  //     }
  //   } else {
  //     allPermissionStatus = AllPermissionsStatus.ALL_PERMISSIONS_GRANTED;
  //   }
  // }

  @action
  Future<void> checkAnyPermissionDenied(
      List<PermissionType> requestedPermissions) async {
    await updatePermissionStatus(requestedPermissions);

    bool allGranted = true;
    bool allDenied = true;
    bool allPermanentlyDenied = true;
    bool someDenied = false;
    bool somePermanentlyDenied = false;

    for (var permission in requestedPermissions) {
      PermissionStatus status;

      switch (permission) {
        case PermissionType.camera:
          status = cameraStatus;
          break;
        case PermissionType.location:
          status = locationStatus;
          break;
        case PermissionType.sms:
          status = smsStatus;
          break;
        case PermissionType.phone:
          status = phoneStatus;
          break;
        // case PermissionType.contacts:
        //   status = contactsStatus;
        //   break;
        // case PermissionType.locationAlways:
        //   status = locationAlwaysStatus;
        //   break;
        // case PermissionType.locationWhenInUse:
        //   status = locationWhenInUseStatus;
        //   break;
        // case PermissionType.mediaLibrary:
        //   status = mediaLibraryStatus;
        //   break;
        // case PermissionType.microphone:
        //   status = microPhoneStatus;
        //   break;
        // case PermissionType.photos:
        //   status = photosStatus;
        //   break;
        // case PermissionType.photosAddonly:
        //   status = photosAddOnlyStatus;
        //   break;
        // case PermissionType.reminders:
        //   status = remindersStatus;
        //   break;
        // case PermissionType.sensors:
        //   status = sensorsStatus;
        //   break;
        // case PermissionType.speech:
        //   status = speechStatus;
        //   break;
        // case PermissionType.storage:
        //   status = storageStatus;
        //   break;
        // case PermissionType.ignoreBatteryOptimization:
        //   status = ignoreBatteryOptimizationStatus;
        //   break;
        // case PermissionType.notification:
        //   status = notificationStatus;
        //   break;
        // case PermissionType.accessMediaLocation:
        //   status = accessMediaLocationStatus;
        //   break;
        // case PermissionType.activityRecognition:
        //   status = activityRecognitionStatus;
        //   break;
        // case PermissionType.bluetooth:
        //   status = bluetoothStatus;
        //   break;
        // case PermissionType.manageExternalStorage:
        //   status = manageExternalStorageStatus;
        //   break;
        // case PermissionType.systemAlertWindow:
        //   status = systemAlertWindowStatus;
        //   break;
        // case PermissionType.requestInstallPackages:
        //   status = requestInstallPackagesStatus;
        //   break;
        // case PermissionType.appTrackingTransparency:
        //   status = appTrackingTransparencyStatus;
        //   break;
        // case PermissionType.accessNotificationPolicy:
        //   status = accessNotificationPolicyStatus;
        //   break;
        // case PermissionType.bluetoothScan:
        //   status = bluetoothScanStatus;
        //   break;
        // case PermissionType.bluetoothAdvertise:
        //   status = bluetoothAdvertiseStatus;
        //   break;
        // case PermissionType.bluetoothConnect:
        //   status = bluetoothConnectStatus;
        //   break;
        // case PermissionType.nearbyWifiDevices:
        //   status = nearbyWifiDevicesStatus;
        //   break;
        // case PermissionType.videos:
        //   status = videosStatus;
        //   break;
        // case PermissionType.audio:
        //   status = audioStatus;
        //   break;
        // case PermissionType.scheduleExactAlarm:
        //   status = scheduleExactAlarmStatus;
        //   break;
        // case PermissionType.sensorsAlways:
        //   status = sensorsAlwaysStatus;
        //   break;
        // case PermissionType.calendarWriteOnly:
        //   status = calendarWriteOnlyStatus;
        //   break;
        // case PermissionType.calendarFullAccess:
        //   status = calendarFullAccessStatus;
        //   break;
        // case PermissionType.backgroundRefresh:
        //   status = backgroundRefreshStatus;
        //   break;
        default:
          status = PermissionStatus.denied;
      }

      if (status != PermissionStatus.granted) {
        allGranted = false;
      }

      if (status != PermissionStatus.denied) {
        allDenied = false;
      } else {
        someDenied = true;
      }

      if (status != PermissionStatus.permanentlyDenied) {
        allPermanentlyDenied = false;
      } else {
        somePermanentlyDenied = true;
      }
    }

    if (allGranted) {
      allPermissionStatus = AllPermissionsStatus.ALL_PERMISSIONS_GRANTED;
    } else if (allDenied) {
      allPermissionStatus = AllPermissionsStatus.ALL_PERMISSIONS_DENIED;
    } else if (allPermanentlyDenied) {
      allPermissionStatus =
          AllPermissionsStatus.ALL_PERMISSIONS_PERMANENTLY_DENIED;
    } else if (someDenied) {
      allPermissionStatus = AllPermissionsStatus.SOME_PERMISSIONS_DENIED;
    } else if (somePermanentlyDenied) {
      allPermissionStatus =
          AllPermissionsStatus.SOME_PERMISSIONS_PERMANENTLY_DENIED;
    }
  }
}
