import 'package:flutter_pepper/app/resorces/api/base_api.dart';
import 'package:flutter_pepper/app/resorces/models/near_model.dart';

class PepperApiProvider extends BaseApiProvider {
  Future<Results> fetchPepperDetail(
      double longitude, double latitude, String keyword) async {
    super.parameters.putIfAbsent('key', () => '96bbd4feacfd779d');
    if (keyword.isNotEmpty) {
      super.parameters.putIfAbsent('keyword', () => keyword);
    } else {
      super.parameters.putIfAbsent('lng', () => longitude.toString());
      super.parameters.putIfAbsent('lat', () => latitude.toString());
    }

    // オススメ順
    super.parameters.putIfAbsent('order', () => '4');
    super.parameters.putIfAbsent('count', () => '100');
    super.parameters.putIfAbsent('format', () => 'json');
    final response = await super.post();
    if (response != null) {
      return Results.fromJson(response);
    } else {
      return Future.value(null);
    }
  }
}
