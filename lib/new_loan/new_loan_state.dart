import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewLoanState extends Equatable {
  NewLoanState([List props = const[]]) : super(props);
}

class ScreenNewLoanState extends NewLoanState { }

//todo fill states