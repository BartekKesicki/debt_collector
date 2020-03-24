import 'package:flutter/material.dart';

import 'app_dimens.dart';
import 'app_strings.dart';

class AppWidgets {

  static Text buildWelcomeText(String text) {
    return Text(text,
      style: TextStyle(color: Colors.grey,
          fontSize: AppDimens.smallTopLabelsFontSize,
          fontWeight: FontWeight.bold),
    );
  }

  static Text buildTitleLabel(String text) {
    return Text(text,
      style: TextStyle(color: Colors.black,
          fontSize: AppDimens.topLabelsFontSize,
          fontWeight: FontWeight.bold),
    );
  }

  static Text buildBigLabel(String text) {
    return _buildText(text, AppDimens.labelsBigSize);
  }

  static Text buildMediumLabel(String text) {
    return _buildText(text, AppDimens.labelsMediumSize);
  }

  static Text _buildText(String text, double fontSize) {
    return Text(text,
      style: TextStyle(color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }

  static RaisedButton createRaisedButton(String text, VoidCallback callback) {
    return RaisedButton(
      color: Colors.green,
      onPressed: callback,
      child: Text(text),
    );
  }

  static AlertDialog createAlertDialog(BuildContext context, String message, String positiveText, String negativeText, VoidCallback onPositivePressed, VoidCallback onNegativePressed) {
    return AlertDialog(
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text(positiveText),
          onPressed: onPositivePressed,
        ),
        FlatButton(
          child: Text(negativeText),
          onPressed: onNegativePressed,
        )
      ],
    );
  }
}