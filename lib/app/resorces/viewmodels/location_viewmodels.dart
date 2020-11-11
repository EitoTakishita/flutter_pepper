import 'package:flutter/services.dart';
import 'package:flutter_pepper/app/repository/location_repository.dart';
import 'package:flutter_pepper/app/resorces/api/location_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import 'base_viewmodels.dart';

class LocationViewModel extends BaseViewModel {
  final completedGetPositionController = BehaviorSubject<bool>();
  final LocationRepository repo = LocationRepository(LocationApiProvider());
  String errorMessage;
  Position currentPosition;
  Stream<bool> get completedGetPosition =>
      completedGetPositionController.stream;

  Future<void> getLocationPermission() async {
    print('Permission getLocationPermission');
    final Location location = new Location();
    try {
      location.requestPermission(); //to lunch location permission popup
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      }
    }
  }

  Future<void> requestPermission() async {
    print("requeset");
    await Permission.location.request();
  }

  Future<bool> checkPermission() async {
    if (await Permission.location.request().isGranted) {
      return true;
    }
    return false;
  }

  Future<void> getLocation() async {
    final results = await repo.getLocation();
    if (results != null) {
      super.showErrorDialogController.sink.add(false);
      completedGetPositionController.sink.add(true);
      currentPosition = results;
      notifyListeners();
    } else {
      errorMessage = '店舗情報が取得できませんでした';
      super.showErrorDialogController.sink.add(true);
      completedGetPositionController.sink.add(false);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    completedGetPositionController.close();
  }
}
