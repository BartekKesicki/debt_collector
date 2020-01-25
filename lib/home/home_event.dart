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

class InitHomePageEvent extends HomeEvent { }

class InitMyLoansPageEvent extends HomeEvent { }

class InitSettingsPageEvent extends HomeEvent { }

class BackButtonEvent extends HomeEvent { }

class InitBillsPageEvent extends HomeEvent { }

class InitSettlementsPageEvent extends HomeEvent { }

class InitCommunityPageEvent extends HomeEvent { }