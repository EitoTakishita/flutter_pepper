import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/location_viewmodels.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/widgets/common/error_dialog.dart';
import 'package:flutter_pepper/app/widgets/components/detail_page.dart';
import 'package:provider/provider.dart';

class CardListScreen extends StatelessWidget {
  CardListScreen({Key key}) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _onWidgetBuilt());
  }

  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final pepperViewModel = Provider.of<PepperViewModel>(context);
    final shops = pepperViewModel.shops;

    return Scaffold(
      appBar: AppBar(title: Text("店舗一覧")),
      key: _key,
      body: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: shops.shop != null ? shops.shop.length : 0,
        itemBuilder: (BuildContext context, int i) {
          final shop = shops.shop[i];
          return AnimatedCard(
            direction: AnimatedCardDirection.left,
            //Initial animation direction
            initDelay: Duration(milliseconds: 0),
            //Delay to initial animation
            duration: Duration(seconds: 1),
            curve: Curves.bounceOut,
            //Animation curve
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 80),
              padding: EdgeInsets.all(pepperViewModel.hasPadding ? 10 : 0),
              child: GestureDetector(
                onTap: () {
                  pepperViewModel.hasPadding = false;
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder: (_, __, ___) => DetailPage(),
                      ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 300,
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Image.network(
                              '${shop.photo.mobile.l}',
                              fit: BoxFit.cover,
                              width: 130,
                              height: 130,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  '${shop.name}',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Noto Sans CJK JP',
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  '${shop.shop_detail_memo}',
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 14,
                                    fontFamily: 'Noto Sans CJK JP',
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onWidgetBuilt() {
    final context = _key.currentContext;

    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);
    locationViewModel.getLocationPermission();
    // locationViewModel.checkPermission();
    locationViewModel.getLocation();

    final pepperViewModel =
        Provider.of<PepperViewModel>(context, listen: false);
    locationViewModel.completedGetPosition.listen((completedGetPosition) {
      if (!completedGetPosition) {
        return;
      }
      final position = locationViewModel.currentPosition;
      print(position);
      pepperViewModel.setPepperDetail(position);
    });

    locationViewModel.showErrorDialog.listen((showErrorDialog) {
      if (!showErrorDialog) {
        return;
      }

      showDialog<void>(
        context: context,
        builder: (context) {
          return ErrorDialog(
            title: 'エラー',
            content: locationViewModel.errorMessage,
            positiveButtonText: '閉じる',
            onPositiveButtonPressed: () =>
                locationViewModel.closeDialog(context),
          );
        },
      );
    });

    pepperViewModel.showErrorDialog.listen((showErrorDialog) {
      if (!showErrorDialog) {
        return;
      }

      showDialog<void>(
        context: context,
        builder: (context) {
          return ErrorDialog(
            title: 'エラー',
            content: pepperViewModel.errorMessage,
            positiveButtonText: '閉じる',
            onPositiveButtonPressed: () => pepperViewModel.closeDialog(context),
          );
        },
      );
    });
  }
}
