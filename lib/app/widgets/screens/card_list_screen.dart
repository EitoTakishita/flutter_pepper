import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/location_viewmodels.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/util/styles.dart';
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
      appBar: AppBar(
        title: Text(
          '店舗一覧',
          style: TextStyle(color: Colors.black, fontFamily: 'Honya'),
        ),
        backgroundColor: Styles.baseColor,
      ),
      key: _key,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/papa.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          controller: PageController(viewportFraction: 0.8),
          // scrollDirection: Axis.vertical,
          itemCount: shops.shop != null ? shops.shop.length : 0,
          itemBuilder: (BuildContext context, int i) {
            final shop = shops.shop[i];
            return Hero(
              tag: shop.name,
              child: AnimatedCard(
                direction: AnimatedCardDirection.left,
                initDelay: Duration(milliseconds: 0),
                duration: Duration(seconds: 1),
                curve: Curves.bounceOut,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 80),
                  padding: EdgeInsets.all(pepperViewModel.hasPadding ? 0 : 0),
                  child: GestureDetector(
                    onTap: () {
                      pepperViewModel.setPadding(true);
                      pepperViewModel.heroTag = shop.name;
                      pepperViewModel.shopDetail = shop;
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 1000),
                            pageBuilder: (_, __, ___) => DetailPage(),
                          ));
                    },
                    onTapDown: (TapDownDetails details) {
                      pepperViewModel.setPadding(true);
                    },
                    onTapCancel: () {
                      pepperViewModel.setPadding(false);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Styles.baseColor,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            height: 150,
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
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 16, bottom: 10),
                                        child: Text(
                                          '${shop.name}',
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Honya',
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: Text(
                                          '${shop.catchCopy}',
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Honya',
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, left: 16),
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Styles.baseColor
                                                .withOpacity(0.1),
                                            border: Border.all(
                                                color: Color(0xFFe8c08b),
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            '★ ${shop.access}',
                                            maxLines: 2,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Honya',
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
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
