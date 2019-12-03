import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MainEvent extends Equatable {
  MainEvent([List props = const []]) : super(props);
}

class ScreenMainEvent extends MainEvent { }

//todo fill events