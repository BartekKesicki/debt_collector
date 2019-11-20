import 'package:debt_collector/utils/app_dimens.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static InputDecoration createTextFieldDecoration(String labelText, String errorText, String hintText) {
    return new InputDecoration(
        labelText: labelText,
        errorText: errorText,
        hintText: hintText,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey));
  }
  
  static Padding withAllPadding(Widget widget, double padding) {
    return Padding(
      child: widget,
      padding: EdgeInsets.all(padding),
    );
  }

  static Padding withTopBelowPadding(Widget widget, double padding) {
    return Padding(
      child: widget,
      padding: EdgeInsets.only(top: padding, bottom: padding),
    );
  }
}