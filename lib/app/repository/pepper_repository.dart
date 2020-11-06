import 'package:flutter_pepper/app/resorces/api/pepper_api.dart';
import 'package:flutter_pepper/app/resorces/models/near_model.dart';

class PepperRepository {
  PepperRepository(this._client);

  final PepperApiProvider _client;

  Future<Results> fetchPepperDetail() {
    return _client.fetchPepperDetail();
  }
}
