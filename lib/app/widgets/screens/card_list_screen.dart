import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/location_viewmodels.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/util/styles.dart';
import 'package:flutter_pepper/app/widgets/common/error_dialog.dart';
import 'package:flutter_pepper/app/widgets/components/card_list_component.dart';
import 'package:provider/provider.dart';

class CardListScreen extends StatelessWidget {
  CardListScreen({Key key}) : super(key: key) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _onWidgetBuilt());
  }

  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final pepperViewModel = Provider.of<PepperViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '店舗一覧',
          style: TextStyle(color: Colors.black, fontFamily: 'Honya'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.sort_rounded,
              color: Colors.black,
            ),
            onPressed: pepperViewModel.setComponent,
          ),
        ],
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
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: pepperViewModel.switchedWidget)),
    );
  }

  void _onWidgetBuilt() {
    final context = _key.currentContext;

    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);
    locationViewModel.getLocationPermission();
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

    // Default
    pepperViewModel.switchedWidget = CardListComponent();

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
