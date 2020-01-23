import 'package:equatable/equatable.dart';

abstract class SettlementsEvent extends Equatable {
  SettlementsEvent([List props = const []]) : super(props);
}

class InitialSettlementsEvent extends SettlementsEvent { }

//todo initial other events