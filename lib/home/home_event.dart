import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class InitNewDebtPageEvent extends HomeEvent { }

class InitNewLoanPageEvent extends HomeEvent { }

class InitMyProfilePageEvent extends HomeEvent { }

class InitMyDebtsPageEvent extends HomeEvent { }

class InitHomePage extends HomeEvent { }

class InitMyLoansPage extends HomeEvent { }

class InitSettingsPage extends HomeEvent { }