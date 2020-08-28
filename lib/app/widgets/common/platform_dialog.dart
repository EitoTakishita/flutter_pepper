import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/util/styles.dart';

class PlatformDialog extends StatelessWidget {
  const PlatformDialog({this.title, this.content, this.actions});

  final String title;
  final String content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final Widget titleWidget = Text(
      title,
      style: Styles.textStyleDialogTitle,
    );

    final Widget contentWidget = Text(
      content,
      style: Styles.textStyleDialogContent,
    );

    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: titleWidget,
            content: contentWidget,
            actions: actions,
          )
        : AlertDialog(
            title: titleWidget,
            content: contentWidget,
            actions: actions,
          );
  }
}
