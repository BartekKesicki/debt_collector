import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}