import 'package:flutter/foundation.dart';
import 'package:flutter_pepper/app/repository/pepper_repository.dart';
import 'package:flutter_pepper/app/resorces/api/pepper_api.dart';
import 'package:flutter_pepper/app/resorces/models/model.dart';

class PepperViewModel with ChangeNotifier {

  final PepperRepository repo = PepperRepository(
      PepperApiProvider());
  Shops _shops = Shops();

  Shops get shops => _shops;

  bool _initialized = false;

  bool get initialized => _initialized;

  Future<void> setPepperDetail() async {
    _shops = await repo.fetchPepperDetail();
    notifyListeners();
  }

  void setInitialized() {
    _initialized = true;
  }
}
