import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyDebtsEvent extends Equatable {
  MyDebtsEvent([List props = const []]) : super(props);
}

class ScreenMyDebtsEvent extends MyDebtsEvent { }

//todo fill events