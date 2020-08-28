import 'package:flutter/material.dart';

class Styles {
  /* Theme Primary Color */
  static const colorPrimary = Color(0xFF333333);
  /* Black — High Emphasis */
  static const colorBlackHighEmphasis = Color.fromRGBO(0, 0, 0, 0.87);

  /* dialog title */
  static const textStyleDialogTitle = TextStyle(
      fontFamily: 'Noto Sans CJK JP',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
      color: colorBlackHighEmphasis);

  /* dialog content */
  static const textStyleDialogContent = TextStyle(
      fontFamily: 'Noto Sans CJK JP',
      fontSize: 16,
      letterSpacing: 0.15,
      color: colorBlackHighEmphasis);

  /* dialog button label */
  static const textStyleDialogButtonLabel = TextStyle(
      fontFamily: 'Noto Sans CJK JP',
      fontSize: 14,
      letterSpacing: 0.75,
      color: colorPrimary);
}
