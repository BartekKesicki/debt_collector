import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  SettingsEvent([List props = const []]) : super(props);
}

class ScreenSettingsEvent extends SettingsEvent { }

//todo fill events