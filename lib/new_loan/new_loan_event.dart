import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewLoanEvent extends Equatable {
  NewLoanEvent([List props = const []]) : super(props);
}

class ScreenNewLoanEvent extends NewLoanEvent { }

//todo fill events