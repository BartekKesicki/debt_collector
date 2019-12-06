import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyProfileEvent extends Equatable {
  MyProfileEvent([List props = const []]) : super(props);
}

class ScreenMyProfileDebtEvent extends MyProfileEvent { }

//todo fill events