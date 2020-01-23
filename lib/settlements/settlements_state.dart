import 'package:equatable/equatable.dart';

abstract class SettlementsState extends Equatable {
  SettlementsState([List props = const[]]) : super(props);
}

class InitialSettlementsState extends SettlementsState { }

//todo fill other states