import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MyProfileState extends Equatable {
  MyProfileState([List props = const[]]) : super(props);
}

class ScreenMyProfileState extends MyProfileState { }

//todo fill states