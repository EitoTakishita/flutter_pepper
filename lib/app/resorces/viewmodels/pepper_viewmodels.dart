import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/repository/pepper_repository.dart';
import 'package:flutter_pepper/app/resorces/api/pepper_api.dart';
import 'package:flutter_pepper/app/resorces/models/near_model.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/base_viewmodels.dart';
import 'package:flutter_pepper/app/widgets/components/card_list_component.dart';
import 'package:flutter_pepper/app/widgets/components/tinder_like_component.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PepperViewModel extends BaseViewModel {
  final PepperRepository repo = PepperRepository(PepperApiProvider());
  Shops _shops = Shops();

  Shops get shops => _shops ?? <Shop>[];
  String errorMessage;
  bool hasPadding = false;
  String heroTag;
  Shop shopDetail = Shop();
  bool isShowCardList = true;
  Widget switchedWidget;

  Future<void> setPepperDetail(Position position) async {
    final results =
        await repo.fetchPepperDetail(position.longitude, position.latitude);
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

  setComponent() {
    print('Takishita setComponent');
    isShowCardList = !isShowCardList;
    switchedWidget =
        isShowCardList ? CardListComponent() : TinderLikeComponent();
    notifyListeners();
  }

  setPadding(bool has) {
    hasPadding = has;
    notifyListeners();
  }

  void switchWidget() {
    print('Takishita switched');
    isShowCardList = !isShowCardList;
    notifyListeners();
  }
}
