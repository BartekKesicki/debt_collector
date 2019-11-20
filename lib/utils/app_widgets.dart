import 'package:flutter/material.dart';

import 'app_dimens.dart';
import 'app_strings.dart';

class AppWidgets {

  static Text buildTopLabel(String text) {
    return Text(text,
      style: TextStyle(color: Colors.black,
          fontSize: AppDimens.topLabelsFontSize,
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
}