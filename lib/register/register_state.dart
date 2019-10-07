
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState extends Equatable {
  RegisterState([List props = const[]]) : super(props);
}

class InitialRegisterState extends RegisterState {
  final String userErrorMessage;
  InitialRegisterState(this.userErrorMessage) : super([userErrorMessage]);
}

class RegisterInProgressState extends RegisterState { }

class RedirectToLoginPageState extends RegisterState { }