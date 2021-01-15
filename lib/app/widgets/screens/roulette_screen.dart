import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/roulette_viewmodels.dart';
import 'package:flutter_pepper/app/util/station_util.dart';
import 'package:flutter_pepper/app/util/styles.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';

class RouletteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RouletteViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ルーレット',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Honya',
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Styles.baseColor,
      ),
      body: SwipeDetector(
          onSwipeRight: () {
            print('swipe');
            viewModel.startRoulette();
          },
          onSwipeLeft: () {
            print('swipe');
            viewModel.startRoulette();
          },
          child: _BodyComponent()),
    );
  }
}

class _BodyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RouletteViewModel>(context);
    return Scaffold(
      backgroundColor: Styles.baseColor,
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/papa.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: FortuneWheel(
              animateFirst: false,
              onAnimationStart: () => viewModel.isAnimating = true,
              onAnimationEnd: () => viewModel.isAnimating = false,
              selected: viewModel.selected,
              items: [
                for (var station in Station.stationList)
                  FortuneItem(
                      child: Text(
                    station,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Honya',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
