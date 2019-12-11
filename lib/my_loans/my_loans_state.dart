import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyLoansState extends Equatable {
  MyLoansState([List props = const[]]) : super(props);
}

class ScreenMyLoansState extends MyLoansState { }

//todo fill states