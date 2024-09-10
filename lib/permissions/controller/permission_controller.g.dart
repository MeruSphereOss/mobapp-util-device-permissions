// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PermissionController on PermissionControllerBase, Store {
  late final _$cameraStatusAtom =
      Atom(name: 'PermissionControllerBase.cameraStatus', context: context);

  @override
  PermissionStatus get cameraStatus {
    _$cameraStatusAtom.reportRead();
    return super.cameraStatus;
  }

  @override
  set cameraStatus(PermissionStatus value) {
    _$cameraStatusAtom.reportWrite(value, super.cameraStatus, () {
      super.cameraStatus = value;
    });
  }

  late final _$locationStatusAtom =
      Atom(name: 'PermissionControllerBase.locationStatus', context: context);

  @override
  PermissionStatus get locationStatus {
    _$locationStatusAtom.reportRead();
    return super.locationStatus;
  }

  @override
  set locationStatus(PermissionStatus value) {
    _$locationStatusAtom.reportWrite(value, super.locationStatus, () {
      super.locationStatus = value;
    });
  }

  late final _$smsStatusAtom =
      Atom(name: 'PermissionControllerBase.smsStatus', context: context);

  @override
  PermissionStatus get smsStatus {
    _$smsStatusAtom.reportRead();
    return super.smsStatus;
  }

  @override
  set smsStatus(PermissionStatus value) {
    _$smsStatusAtom.reportWrite(value, super.smsStatus, () {
      super.smsStatus = value;
    });
  }

  late final _$phoneStatusAtom =
      Atom(name: 'PermissionControllerBase.phoneStatus', context: context);

  @override
  PermissionStatus get phoneStatus {
    _$phoneStatusAtom.reportRead();
    return super.phoneStatus;
  }

  @override
  set phoneStatus(PermissionStatus value) {
    _$phoneStatusAtom.reportWrite(value, super.phoneStatus, () {
      super.phoneStatus = value;
    });
  }

  late final _$allPermissionStatusAtom = Atom(
      name: 'PermissionControllerBase.allPermissionStatus', context: context);

  @override
  String get allPermissionStatus {
    _$allPermissionStatusAtom.reportRead();
    return super.allPermissionStatus;
  }

  @override
  set allPermissionStatus(String value) {
    _$allPermissionStatusAtom.reportWrite(value, super.allPermissionStatus, () {
      super.allPermissionStatus = value;
    });
  }

  late final _$requestCameraPermissionAsyncAction = AsyncAction(
      'PermissionControllerBase.requestCameraPermission',
      context: context);

  @override
  Future<PermissionStatus> requestCameraPermission() {
    return _$requestCameraPermissionAsyncAction
        .run(() => super.requestCameraPermission());
  }

  late final _$requestLocationPermissionAsyncAction = AsyncAction(
      'PermissionControllerBase.requestLocationPermission',
      context: context);

  @override
  Future<PermissionStatus> requestLocationPermission() {
    return _$requestLocationPermissionAsyncAction
        .run(() => super.requestLocationPermission());
  }

  late final _$requestSmsPermissionAsyncAction = AsyncAction(
      'PermissionControllerBase.requestSmsPermission',
      context: context);

  @override
  Future<PermissionStatus> requestSmsPermission() {
    return _$requestSmsPermissionAsyncAction
        .run(() => super.requestSmsPermission());
  }

  late final _$requestPhonePermissionAsyncAction = AsyncAction(
      'PermissionControllerBase.requestPhonePermission',
      context: context);

  @override
  Future<PermissionStatus> requestPhonePermission() {
    return _$requestPhonePermissionAsyncAction
        .run(() => super.requestPhonePermission());
  }

  late final _$updatePermissionStatusAsyncAction = AsyncAction(
      'PermissionControllerBase.updatePermissionStatus',
      context: context);

  @override
  Future<void> updatePermissionStatus(
      List<PermissionType> requestedPermissions) {
    return _$updatePermissionStatusAsyncAction
        .run(() => super.updatePermissionStatus(requestedPermissions));
  }

  late final _$checkAnyPermissionDeniedAsyncAction = AsyncAction(
      'PermissionControllerBase.checkAnyPermissionDenied',
      context: context);

  @override
  Future<void> checkAnyPermissionDenied(
      List<PermissionType> requestedPermissions) {
    return _$checkAnyPermissionDeniedAsyncAction
        .run(() => super.checkAnyPermissionDenied(requestedPermissions));
  }

  @override
  String toString() {
    return '''
cameraStatus: ${cameraStatus},
locationStatus: ${locationStatus},
smsStatus: ${smsStatus},
phoneStatus: ${phoneStatus},
allPermissionStatus: ${allPermissionStatus}
    ''';
  }
}
