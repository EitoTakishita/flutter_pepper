import 'package:geolocator/geolocator.dart';

class LocationApiProvider {
  Future<Position> getLocation() async {
    Position _currentPosition = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(_currentPosition);
    return _currentPosition;
  }
}
