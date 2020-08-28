import 'package:flutter_pepper/app/resorces/api/base_api.dart';
import 'package:flutter_pepper/app/resorces/models/model.dart';

class PepperApiProvider extends BaseApiProvider {
  Future<Results> fetchPepperDetail() async {
    super.parameters.putIfAbsent('key', () => '96bbd4feacfd779d');
    super.parameters.putIfAbsent('large_area', () => 'Z011');
    super.parameters.putIfAbsent('format', () => 'json');
    final response = await super.post();
    if (response != null) {
      return Results.fromJson(response);
    } else {
      return Future.value(null);
    }
  }
}
