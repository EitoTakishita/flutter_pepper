import 'dart:math' as math;

import 'package:flutter_pepper/app/util/station_util.dart';

import 'base_viewmodels.dart';

class RouletteViewModel extends BaseViewModel {
  bool isAnimating = false;
  int selected = 0;

  void startRoulette() {
    const min = 0;
    var max = Station.stationList.length;
    var rnd = math.Random();
    var randomIndex = min + rnd.nextInt(max - min);
    selected = randomIndex;
    notifyListeners();
  }
}
