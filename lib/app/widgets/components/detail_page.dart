import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pepperViewModel =
        Provider.of<PepperViewModel>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              child: Hero(
                tag: pepperViewModel.heroTag,
                child: imageContents(context),
              ),
            ),
            Container(
              child: Text('content'),
            )
          ],
        ));
  }

  // 画像Widget
  Widget imageContents(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
        height: 277,
        color: Colors.white,
        child: Container(
            child: Stack(
          children: <Widget>[
            Image.asset(
              'image/image.jpg',
              fit: BoxFit.cover,
            ),
            Column(
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: statusBarHeight),
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
                            color: Colors.blue,
                            shape: CircleBorder(),
                            onPressed: () {
                              Navigator.pop(
                                context,
                              );
                            },
                          ),
                        )
                      ]),
                )
              ],
            )
          ],
        )));
  }
}
