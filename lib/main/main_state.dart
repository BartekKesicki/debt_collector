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
  final String clients;
  final String totalDebts;
  final String totalLoans;
  final String debtInterests;
  final String loanInterests;

  ScreenMainState(this.userName, this.saldo, this.clients, this.totalDebts, this.totalLoans, this.debtInterests, this.loanInterests);
}

//todo fill states