import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MainState extends Equatable {
  MainState([List props = const[]]) : super(props);
}

class ScreenMainState extends MainState {
  final String userName;

  ScreenMainState(this.userName);
}

//todo fill states