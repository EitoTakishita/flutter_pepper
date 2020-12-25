import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/util/styles.dart';
import 'package:flutter_pepper/app/widgets/components/shop_info.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pepperViewModel =
        Provider.of<PepperViewModel>(context, listen: false);
    return Scaffold(
        backgroundColor: Styles.baseColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Styles.baseColor,
              child: Hero(
                tag: pepperViewModel.heroTag,
                child: imageContents(context),
              ),
            ),
            ShopInfo(),
          ],
        ));
  }

  // 画像Widget
  Widget imageContents(BuildContext context) {
    final shop =
        Provider.of<PepperViewModel>(context, listen: false).shopDetail;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
          height: 320,
          color: Styles.baseColor,
          child: Container(
              child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: FittedBox(
                    child: Image.network(
                      '${shop.photo.pc.l}',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Column(
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // これで両端に寄せる
                          children: <Widget>[
                            Container(),
                            Container(
                              child: RaisedButton(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                color: Colors.black.withOpacity(0.6),
                                shape: CircleBorder(),
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                              ),
                            )
                          ]),
                    ),
                  )
                ],
              )
            ],
          ))),
    );
  }
}
