import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BaseViewModel with ChangeNotifier {
  final showErrorDialogController = BehaviorSubject<bool>();

  Stream<bool> get showErrorDialog => showErrorDialogController.stream;

  void closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    showErrorDialogController.close();
    super.dispose();
  }
}
