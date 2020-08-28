import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/widgets/common/platform_dialog.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(
      {this.title,
      this.content,
      this.positiveButtonText,
      this.onPositiveButtonPressed});

  final String title;
  final String content;
  final String positiveButtonText;
  final void Function() onPositiveButtonPressed;

  @override
  Widget build(BuildContext context) {
    return PlatformDialog(
      title: title,
      content: content,
      actions: <Widget>[
        FlatButton(
          child: buildDialogButton(positiveButtonText),
          onPressed: onPositiveButtonPressed,
        ),
      ],
    );
  }

  Widget buildDialogButton(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Noto Sans CJK JP',
        fontSize: 14,
        letterSpacing: 0.75,
        color: Color(0xff475499),
      ),
    );
  }
}
