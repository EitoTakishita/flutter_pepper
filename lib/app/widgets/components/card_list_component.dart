import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/util/styles.dart';
import 'package:flutter_pepper/app/widgets/components/detail_page.dart';
import 'package:provider/provider.dart';

class CardListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pepperViewModel = Provider.of<PepperViewModel>(context);
    pepperViewModel.shops;
    final shops = pepperViewModel.shops;
    return Container(
      child: ListView.builder(
        controller: PageController(viewportFraction: 0.8),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      padding: const EdgeInsets.only(left: 16),
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
                                          color:
                                              Styles.baseColor.withOpacity(0.1),
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
    );
  }
}
