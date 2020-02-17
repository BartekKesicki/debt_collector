import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyLoansEvent extends Equatable {
  MyLoansEvent([List props = const []]) : super(props);
}

class ScreenMyLoansEvent extends MyLoansEvent { }

//todo fill events