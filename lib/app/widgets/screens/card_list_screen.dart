import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/widgets/common/error_dialog.dart';
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
      body: ListView.builder(
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
            child: GestureDetector(
//              onTap: () => context.read<ShopController>().increment(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 150,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'images/sample.jpg',
                            fit: BoxFit.cover,
                            width: 130,
                            height: 130,
                          ),
                        ),
                        Container(
                          child: Text(
                            '${shop.name}',
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
    final pepperViewModel =
        Provider.of<PepperViewModel>(context, listen: false);
    pepperViewModel.setPepperDetail();
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
