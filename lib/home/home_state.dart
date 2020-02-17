import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const[]]) : super(props);
}

class HomeInitialState extends HomeState { }

class NewDebtInitialState extends HomeState { }

class NewLoanInitialState extends HomeState { }

class MyProfileInitialState extends HomeState { }

class SettingsInitialState extends HomeState { }

class BackButtonState extends HomeState { }

class BillsPageState extends HomeState { }

class SettlementsPageState extends HomeState { }

class CommunityPageState extends HomeState { }