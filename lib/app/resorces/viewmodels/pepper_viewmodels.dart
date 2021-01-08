import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/repository/pepper_repository.dart';
import 'package:flutter_pepper/app/resorces/api/pepper_api.dart';
import 'package:flutter_pepper/app/resorces/models/near_model.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/base_viewmodels.dart';
import 'package:flutter_pepper/app/widgets/components/card_list_component.dart';
import 'package:flutter_pepper/app/widgets/components/tinder_like_component.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String barTitle = '';

  final _completedEditKeyword = BehaviorSubject<bool>();
  Stream<bool> get completedEditKeyword => _completedEditKeyword.stream;

  Future<void> initialize() async {
    _completedEditKeyword.sink.add(false);
    final _pref = await SharedPreferences.getInstance();
    barTitle = _pref.getString('keyword') ?? '';
    notifyListeners();
  }

  Future<void> confirmKeyword() async {
    final _pref = await SharedPreferences.getInstance();
    await _pref.setString('keyword', barTitle);
    _completedEditKeyword.sink.add(true);
    notifyListeners();
  }

  Future<void> setPepperDetail(Position position) async {
    final results = await repo.fetchPepperDetail(
        position.longitude, position.latitude, barTitle);
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
    isShowCardList = !isShowCardList;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _completedEditKeyword.close();
  }
}
