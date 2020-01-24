import 'package:equatable/equatable.dart';

abstract class CommunityEvent extends Equatable {
  CommunityEvent([List props = const[]]) : super(props);
}

class InitialCommunityEvent extends CommunityEvent { }

//todo add other events