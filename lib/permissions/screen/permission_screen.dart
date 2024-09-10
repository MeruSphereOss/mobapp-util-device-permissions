import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobapp_util_device_permissions/permission_constants.dart';
import 'package:mobapp_util_device_permissions/permissions/all_permission_status.dart';
import 'package:mobapp_util_device_permissions/permissions/common_widgets/permission_card_widget.dart';
import 'package:mobapp_util_device_permissions/permissions/controller/permission_controller.dart';
import 'package:mobapp_util_device_permissions/permissions/permission_stage_enum.dart';
import 'package:mobapp_util_device_permissions/permissions/permission_type_enum.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';

// ignore: must_be_immutable
class PermissionScreen extends StatefulWidget {
  List<PermissionType> requestedPermissions;
  Function(String) onConfirmCallBack;
  String? permissionScreenTitle;
  Color? permissionScreenTitleColor;
  Color? permissionScreenTitleBackgroundColor;
  Color? continueBtnBackgroundColor;
  Color? continueBtnColor;
  int? continueBtnFontSize;
  Color? confirmBtnColor;

  PermissionScreen(
      {required this.requestedPermissions,
      required this.onConfirmCallBack,
      this.permissionScreenTitle,
      this.permissionScreenTitleColor,
      this.permissionScreenTitleBackgroundColor,
      this.continueBtnBackgroundColor,
      this.continueBtnColor,
      this.continueBtnFontSize,
      this.confirmBtnColor,
      super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  PermissionController permissionController = PermissionController();
  late List<PermissionType> parameters;
  String successMessage = "";

  @override
  void initState() {
    super.initState();
    parameters = widget.requestedPermissions;
    permissionController.updatePermissionStatus(parameters);
    permissionController.checkAnyPermissionDenied(parameters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.permissionScreenTitle ?? PERMISSION_TITLE,
          style: TextStyle(
              color: widget.permissionScreenTitleColor ?? Colors.white),
        ),
        backgroundColor: widget.permissionScreenTitleBackgroundColor ??
            const Color(0xFF16558F),
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Visibility(
                        visible: parameters.contains(PermissionType.camera),
                        child: permissionCardWithImage(
                          permissionName: CAMERA,
                          permissionIcon: Icons.camera_alt,
                          permissionStatusIcon: permissionStatusIcon(
                              permissionController.cameraStatus),
                          permissionStatus:
                              permissionController.permissionStatusName(
                                  permissionController.cameraStatus),
                          color: permissionStatusColor(
                              permissionController.cameraStatus),
                          onTap: () async {
                            permissionController.requestCameraPermission();
                          },
                        ),
                      ),
                      //const SizedBox(height: 14),
                      Visibility(
                        visible: parameters.contains(PermissionType.location),
                        child: permissionCardWithImage(
                          permissionName: LOCATION,
                          permissionIcon: Icons.location_on,
                          permissionStatusIcon: permissionStatusIcon(
                              permissionController.locationStatus),
                          permissionStatus:
                              permissionController.permissionStatusName(
                                  permissionController.locationStatus),
                          color: permissionStatusColor(
                              permissionController.locationStatus),
                          onTap: () async {
                            permissionController.requestLocationPermission();
                          },
                        ),
                      ),
                      //const SizedBox(height: 14),
                      Visibility(
                        visible: parameters.contains(PermissionType.sms),
                        child: permissionCardWithImage(
                          permissionName: SMS,
                          permissionIcon: Icons.sms,
                          permissionStatusIcon: permissionStatusIcon(
                              permissionController.smsStatus),
                          permissionStatus:
                              permissionController.permissionStatusName(
                                  permissionController.smsStatus),
                          color: permissionStatusColor(
                              permissionController.smsStatus),
                          onTap: () async {
                            permissionController.requestSmsPermission();
                          },
                        ),
                      ),
                      //const SizedBox(height: 14),
                      Visibility(
                        visible: parameters.contains(PermissionType.phone),
                        child: permissionCardWithImage(
                          permissionName: PHONE,
                          permissionIcon: Icons.phone,
                          permissionStatusIcon: permissionStatusIcon(
                              permissionController.phoneStatus),
                          permissionStatus:
                              permissionController.permissionStatusName(
                                  permissionController.phoneStatus),
                          color: permissionStatusColor(
                              permissionController.phoneStatus),
                          onTap: () async {
                            permissionController.requestPhonePermission();
                          },
                        ),
                      ),
                      //const SizedBox(height: 14),
                      // Visibility(
                      //   visible:
                      //       parameters.contains(PermissionType.locationAlways),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Location Always',
                      //     permissionIcon: Icons.location_on,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.locationAlwaysStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.locationAlwaysStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.locationAlwaysStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestLocationAlwaysPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.contacts),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Contacts',
                      //     permissionIcon: Icons.contacts,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.contactsStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.contactsStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.contactsStatus),
                      //     onTap: () async {
                      //       permissionController.requestContactsPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.locationWhenInUse),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Location When In Use',
                      //     permissionIcon: Icons.location_pin,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.locationWhenInUseStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.locationWhenInUseStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.locationWhenInUseStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestLocationWhenInUsePermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible:
                      //       parameters.contains(PermissionType.mediaLibrary),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Media Library',
                      //     permissionIcon: Icons.perm_media,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.mediaLibraryStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.mediaLibraryStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.mediaLibraryStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestMediaLibraryPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.microphone),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Microphone',
                      //     permissionIcon: Icons.mic_none_rounded,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.microPhoneStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.microPhoneStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.microPhoneStatus),
                      //     onTap: () async {
                      //       permissionController.requestMicrophonePermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.photos),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Photos',
                      //     permissionIcon: Icons.photo_album,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.photosStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.photosStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.photosStatus),
                      //     onTap: () async {
                      //       permissionController.requestPhotosPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible:
                      //       parameters.contains(PermissionType.photosAddonly),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Photos Add Only',
                      //     permissionIcon: Icons.photo,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.photosAddOnlyStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.photosAddOnlyStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.photosAddOnlyStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestPhotosAddOnlyPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.reminders),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Reminders',
                      //     permissionIcon: Icons.alarm,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.remindersStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.remindersStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.remindersStatus),
                      //     onTap: () async {
                      //       permissionController.requestRemindersPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.sensors),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Sensors',
                      //     permissionIcon: Icons.sensors,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.sensorsStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.sensorsStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.sensorsStatus),
                      //     onTap: () async {
                      //       permissionController.requestSensorsPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.speech),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Speech',
                      //     permissionIcon: Icons.mic,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.speechStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.speechStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.speechStatus),
                      //     onTap: () async {
                      //       permissionController.requestSpeechPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.storage),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Storage',
                      //     permissionIcon: Icons.storage,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.storageStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.storageStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.storageStatus),
                      //     onTap: () async {
                      //       permissionController.requestStoragePermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.ignoreBatteryOptimization),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Ignore Battery Optimization',
                      //     permissionIcon: Icons.battery_charging_full_outlined,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController
                      //             .ignoreBatteryOptimizationStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .ignoreBatteryOptimizationStatus),
                      //     color: permissionStatusColor(permissionController
                      //         .ignoreBatteryOptimizationStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestIgnoreBatteryOptimizationsPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible:
                      //       parameters.contains(PermissionType.notification),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Notification',
                      //     permissionIcon: Icons.notifications,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.notificationStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.notificationStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.notificationStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestNotificationPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.accessMediaLocation),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Access Media Location',
                      //     permissionIcon: Icons.perm_media_rounded,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.accessMediaLocationStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .accessMediaLocationStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.accessMediaLocationStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestAccessMediaLocationPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.activityRecognition),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Activity Recognition',
                      //     permissionIcon: Icons.local_activity_sharp,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.activityRecognitionStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .activityRecognitionStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.activityRecognitionStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestActivityRecognitionPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.bluetooth),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Bluetooth',
                      //     permissionIcon: Icons.bluetooth,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.bluetoothStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.bluetoothStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.bluetoothStatus),
                      //     onTap: () async {
                      //       permissionController.requestBluetoothPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.manageExternalStorage),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Manage External Storage',
                      //     permissionIcon: Icons.sd_storage,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.manageExternalStorageStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .manageExternalStorageStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.manageExternalStorageStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestManageExternalStoragePermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.systemAlertWindow),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'System Alert Window',
                      //     permissionIcon: Icons.system_security_update_warning,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.systemAlertWindowStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.systemAlertWindowStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.systemAlertWindowStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestSystemAlertWindowPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.requestInstallPackages),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Request Install Packages',
                      //     permissionIcon: Icons.install_mobile,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController
                      //             .requestInstallPackagesStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .requestInstallPackagesStatus),
                      //     color: permissionStatusColor(permissionController
                      //         .requestInstallPackagesStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestRequestInstallPackagesPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.appTrackingTransparency),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'App Tracking Transparency',
                      //     permissionIcon: Icons.track_changes_outlined,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController
                      //             .appTrackingTransparencyStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .appTrackingTransparencyStatus),
                      //     color: permissionStatusColor(permissionController
                      //         .appTrackingTransparencyStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestAppTrackingTransparencyPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.accessNotificationPolicy),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Access Notification Policy',
                      //     permissionIcon: Icons.notifications_active_outlined,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController
                      //             .accessNotificationPolicyStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .accessNotificationPolicyStatus),
                      //     color: permissionStatusColor(permissionController
                      //         .accessNotificationPolicyStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestAccessNotificationPolicyPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible:
                      //       parameters.contains(PermissionType.bluetoothScan),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Bluetooth Scan',
                      //     permissionIcon: Icons.bluetooth_sharp,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.bluetoothScanStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.bluetoothScanStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.bluetoothScanStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestBluetoothScanPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.bluetoothAdvertise),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Bluetooth Advertise',
                      //     permissionIcon: Icons.bluetooth_connected_outlined,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.bluetoothAdvertiseStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .bluetoothAdvertiseStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.bluetoothAdvertiseStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestBluetoothAdvertisePermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.bluetoothConnect),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Bluetooth Connect',
                      //     permissionIcon: Icons.bluetooth_connected_sharp,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.bluetoothConnectStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.bluetoothConnectStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.bluetoothConnectStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestBluetoothConnectPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.nearbyWifiDevices),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Nearby Wifi Devices',
                      //     permissionIcon: Icons.wifi_find_sharp,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.nearbyWifiDevicesStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.nearbyWifiDevicesStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.nearbyWifiDevicesStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestNearbywifiDevicesPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.videos),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Videos',
                      //     permissionIcon: Icons.video_collection,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.videosStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.videosStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.videosStatus),
                      //     onTap: () async {
                      //       permissionController.requestVideosPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters.contains(PermissionType.audio),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Audio',
                      //     permissionIcon: Icons.audiotrack_rounded,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.audioStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.audioStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.audioStatus),
                      //     onTap: () async {
                      //       permissionController.requestAudioPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.scheduleExactAlarm),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Schedule Exact Alarm',
                      //     permissionIcon: Icons.alarm_on_sharp,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.scheduleExactAlarmStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .scheduleExactAlarmStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.scheduleExactAlarmStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestScheduleExactAlarmPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible:
                      //       parameters.contains(PermissionType.sensorsAlways),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Sensors Always',
                      //     permissionIcon: Icons.sensors_sharp,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.sensorsAlwaysStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.sensorsAlwaysStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.sensorsAlwaysStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestSensorsAlwaysPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.calendarWriteOnly),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Calendar Write Only',
                      //     permissionIcon: Icons.edit_calendar_sharp,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.calendarWriteOnlyStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.calendarWriteOnlyStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.calendarWriteOnlyStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestCalendarWriteOnlyPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.calendarFullAccess),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Calendar FullAccess',
                      //     permissionIcon: Icons.calendar_month_outlined,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.calendarFullAccessStatus),
                      //     permissionStatus: permissionController
                      //         .permissionStatusName(permissionController
                      //             .calendarFullAccessStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.calendarFullAccessStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestCalendarFullAccessPermission();
                      //     },
                      //   ),
                      // ),
                      // //const SizedBox(height: 14),
                      // Visibility(
                      //   visible: parameters
                      //       .contains(PermissionType.backgroundRefresh),
                      //   child: permissionCardWithImage(
                      //     permissionName: 'Background Refresh',
                      //     permissionIcon: Icons.refresh_sharp,
                      //     permissionStatusIcon: permissionStatusIcon(
                      //         permissionController.backgroundRefreshStatus),
                      //     permissionStatus:
                      //         permissionController.permissionStatusName(
                      //             permissionController.backgroundRefreshStatus),
                      //     color: permissionStatusColor(
                      //         permissionController.backgroundRefreshStatus),
                      //     onTap: () async {
                      //       permissionController
                      //           .requestBackgroundRefreshPermission();
                      //     },
                      //   ),
                      // ),

                      // const SizedBox(height: 20),
                      // allowPermissionsButton(context)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: allowPermissionsButton(context),
            ),
          ],
        );
      }),
    );
  }

  allowPermissionsButton(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          setState(() {
            permissionController.checkAnyPermissionDenied(parameters);
            displayAllPermissionStatus(context);
          });
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.continueBtnBackgroundColor ?? const Color(0xff16558F),
          ),
          alignment: Alignment.center,
          child: Text(
            CONTINUE,
            style: boldTextStyle(
                size: widget.continueBtnFontSize ?? 18,
                color: widget.continueBtnColor ?? Colors.white),
          ),
        ),
      );
    });
  }

  @action
  void displayAllPermissionStatus(BuildContext context) async {
    if (permissionController.allPermissionStatus ==
            AllPermissionsStatus.SOME_PERMISSIONS_DENIED ||
        permissionController.allPermissionStatus ==
            AllPermissionsStatus.ALL_PERMISSIONS_DENIED) {
      QuickAlert.show(
        borderRadius: 24,
        context: context,
        confirmBtnColor: widget.confirmBtnColor ?? const Color(0xff16558F),
        type: QuickAlertType.error,
        title: SORRY,
        text: SOME_PERMISSIONS_DENIED,
      );
    } else if (permissionController.allPermissionStatus ==
            AllPermissionsStatus.SOME_PERMISSIONS_PERMANENTLY_DENIED ||
        permissionController.allPermissionStatus ==
            AllPermissionsStatus.ALL_PERMISSIONS_PERMANENTLY_DENIED) {
      QuickAlert.show(
          borderRadius: 24,
          context: context,
          confirmBtnColor: widget.confirmBtnColor ?? const Color(0xff16558F),
          type: QuickAlertType.error,
          confirmBtnText: OPEN_SETTINGS,
          title: SORRY,
          text: SOME_PERMISSIONS_PERMANENTLY_DENIED,
          onConfirmBtnTap: () => {
                openAppSettings(),
                Navigator.pop(context),
                permissionController.updatePermissionStatus(parameters)
              });
    } else if (permissionController.allPermissionStatus ==
        AllPermissionsStatus.ALL_PERMISSIONS_GRANTED) {
      QuickAlert.show(
          borderRadius: 24,
          context: context,
          confirmBtnColor: widget.confirmBtnColor ?? const Color(0xff16558F),
          type: QuickAlertType.success,
          title: THANK_YOU,
          text: ALL_PERMISSIONS_GRANTED,
          onConfirmBtnTap: () => {
                Navigator.pop(context),
                widget.onConfirmCallBack(PermissionStage.completed.name),
              });
    } else {
      return null;
    }
  }
}
