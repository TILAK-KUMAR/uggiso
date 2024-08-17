import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    // Request location permissions
    await _requestPermission();

    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
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
}
