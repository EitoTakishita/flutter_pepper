import 'package:geolocator/geolocator.dart';

class LocationApiProvider {
  Future<void> getLocation() async {
    Position _currentPosition = await GeolocatorPlatform.instance
        .getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high); // ここで精度を「high」に指定している
    print(_currentPosition);
  }
}
