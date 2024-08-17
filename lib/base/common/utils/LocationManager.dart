import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationManager {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<LocationInfo> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationInfo(
        latitude: 0,
        longitude: 0,
        permissionState: PermissionState.locationServiceDisabled,
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return LocationInfo(
          latitude: 0,
          longitude: 0,
          permissionState: PermissionState.denied,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationInfo(
        latitude: 0,
        longitude: 0,
        permissionState: PermissionState.deniedForever,
      );
    }

    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
      );
      return LocationInfo(
        latitude: position.latitude,
        longitude: position.longitude,
        permissionState: PermissionState.granted,
      );
    } catch (e) {
      return LocationInfo(
        latitude: 0,
        longitude: 0,
        permissionState: PermissionState.none,
      );
    }
  }

  Future<void> _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isDenied) {
      return Future.error('Location permissions are denied.');
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  /// Open location settings of the app
  Future<bool> openLocationSettings() async {
    return Geolocator.openLocationSettings();
  }
}

enum PermissionState {
  granted,
  denied,
  deniedForever,
  locationServiceDisabled,
  none,
}


class LocationInfo {
  final double latitude;
  final double longitude;
  final PermissionState permissionState;

  LocationInfo({
    required this.latitude,
    required this.longitude,
    required this.permissionState,
  });
}
