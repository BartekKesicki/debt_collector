import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewDebtState extends Equatable {
  NewDebtState([List props = const[]]) : super(props);
}

class ScreenNewDebtState extends NewDebtState { }

//todo fill states