import 'package:geolocator/geolocator.dart';

class LocationApiProvider {
  Future<void> getLocation() async {
    Position _currentPosition = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(_currentPosition);
  }
}
