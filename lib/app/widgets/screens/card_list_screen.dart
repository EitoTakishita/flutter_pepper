import 'package:appbar_textfield/appbar_textfield.dart';
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
      key: _key,
      resizeToAvoidBottomInset: false,
      appBar: AppBarTextField(
        title: Text(
          pepperViewModel.barTitle.isNotEmpty
              ? '${pepperViewModel.barTitle} の検索結果...'
              : 'キーワードを設定できます',
          style: TextStyle(
            color: pepperViewModel.barTitle.isNotEmpty
                ? Colors.black
                : Colors.black.withOpacity(0.5),
            fontFamily: 'Honya',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.sort_rounded,
            color: Colors.black,
          ),
          onPressed: pepperViewModel.setComponent,
        ),
        searchButtonIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        clearBtnIcon: Icon(Icons.close, color: Colors.black),
        cursorColor: Colors.black,
        searchContainerColor: Styles.baseColor,
        backgroundColor: Styles.baseColor,
        onBackPressed: () => pepperViewModel.confirmKeyword(),
        onClearPressed: () => pepperViewModel.barTitle = '',
        onChanged: (String value) => pepperViewModel.barTitle = value,
      ),
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

  void searchShops() {
    final context = _key.currentContext;

    final pepperViewModel =
        Provider.of<PepperViewModel>(context, listen: false);
    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);

    final position = locationViewModel.currentPosition;
    print(position);
    pepperViewModel.setPepperDetail(position);
  }

  void _onWidgetBuilt() {
    final context = _key.currentContext;

    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);
    locationViewModel.getLocationPermission();
    locationViewModel.getLocation();

    final pepperViewModel = Provider.of<PepperViewModel>(context, listen: false)
      ..initialize();
    locationViewModel.completedGetPosition.listen((completedGetPosition) {
      if (!completedGetPosition) {
        return;
      }
      searchShops();
    });

    pepperViewModel.completedEditKeyword.listen((completedEditKeyword) {
      if (!completedEditKeyword) {
        return;
      }
      searchShops();
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
