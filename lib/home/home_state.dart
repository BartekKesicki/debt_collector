import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const[]]) : super(props);
}

class HomeInitialState extends HomeState { }