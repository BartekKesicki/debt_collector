import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) : super(props);
}

class SubmitRegisterEvent extends RegisterEvent {
  final String login;
  final String password;
  final String confirmPassword;

  SubmitRegisterEvent([this.login, this.password, this.confirmPassword]) : super([login, password, confirmPassword]);
}

class ValidateRegisterEvent extends RegisterEvent {
  final String login;
  final String password;
  final String confirmPassword;

  ValidateRegisterEvent([this.login, this.password, this.confirmPassword]) : super([login, password, confirmPassword]);
}

class RedirectToLoginPageEvent extends RegisterEvent { }

class BackButtonEvent extends RegisterEvent { }