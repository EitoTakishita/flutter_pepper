import 'package:flutter_pepper/app/resorces/api/location_api.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  LocationRepository(this._client);

  final LocationApiProvider _client;

  Future<Position> getLocation() {
    return _client.getLocation();
  }
}
