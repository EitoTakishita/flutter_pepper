import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/repository/location_repository.dart';
import 'package:flutter_pepper/app/resorces/api/location_api.dart';

class LocationViewModel with ChangeNotifier {
  final LocationRepository repo = LocationRepository(LocationApiProvider());
  // Shops _shops = Shops();
  // Shops get shops => _shops ?? <Shop>[];
  // String errorMessage;
  //
  // Future<void> setPepperDetail() async {
  //   final results = await repo.fetchPepperDetail();
  //   if (results != null) {
  //     super.showErrorDialogController.sink.add(false);
  //     _shops = results.results;
  //     final database = openDatabase(
  //       join(await getDatabasesPath(), 'memo_database.db'),
  //     );
  //     notifyListeners();
  //   } else {
  //     errorMessage = '店舗情報が取得できませんでした';
  //     super.showErrorDialogController.sink.add(true);
  //   }
  // }
}
