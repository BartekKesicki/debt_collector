import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyDebtsState extends Equatable {
  MyDebtsState([List props = const[]]) : super(props);
}

class ScreenMyDebtsState extends MyDebtsState { }

//todo fill states