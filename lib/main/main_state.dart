import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MainState extends Equatable {
  MainState([List props = const[]]) : super(props);
}

class InitialScreenMainState extends MainState { }

class ScreenMainState extends MainState {
  final String userName;
  final String saldo;
  final String totalDebts;
  final String totalLoans;

  ScreenMainState(this.userName, this.saldo, this.totalDebts, this.totalLoans);
}

//todo fill states