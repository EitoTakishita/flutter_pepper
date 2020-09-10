import 'package:flutter_pepper/app/resorces/api/location_api.dart';

class LocationRepository {
  LocationRepository(this._client);

  final LocationApiProvider _client;

  Future<void> getLocation() {
    _client.getLocation();
  }
}
