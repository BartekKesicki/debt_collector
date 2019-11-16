
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState extends Equatable {
  RegisterState([List props = const[]]) : super(props);
}

class InitialRegisterState extends RegisterState {
  final String userErrorMessage;
  final String passwordErrorMessage;
  final String confirmPasswordErrorMessage;
  InitialRegisterState([this.userErrorMessage, this.passwordErrorMessage, this.confirmPasswordErrorMessage]) : super([userErrorMessage, passwordErrorMessage, confirmPasswordErrorMessage]);
}

class RegisterInProgressState extends RegisterState { }

class RedirectToLoginPageState extends RegisterState { }