import 'package:flutter_pepper/app/repository/pepper_repository.dart';
import 'package:flutter_pepper/app/resorces/api/pepper_api.dart';
import 'package:flutter_pepper/app/resorces/models/near_model.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/base_viewmodels.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PepperViewModel extends BaseViewModel {
  final PepperRepository repo = PepperRepository(PepperApiProvider());
  Shops _shops = Shops();
  Shops get shops => _shops ?? <Shop>[];
  String errorMessage;

  Future<void> setPepperDetail() async {
    final results = await repo.fetchPepperDetail();
    if (results != null) {
      super.showErrorDialogController.sink.add(false);
      _shops = results.results;
      final database = openDatabase(
        join(await getDatabasesPath(), 'memo_database.db'),
      );
      notifyListeners();
    } else {
      errorMessage = '店舗情報が取得できませんでした';
      super.showErrorDialogController.sink.add(true);
    }
  }
}
