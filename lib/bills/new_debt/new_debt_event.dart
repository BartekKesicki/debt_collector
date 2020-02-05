import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewDebtEvent extends Equatable {
  NewDebtEvent([List props = const []]) : super(props);
}

class ScreenNewDebtEvent extends NewDebtEvent { }

//todo fill events