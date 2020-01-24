import 'package:equatable/equatable.dart';

abstract class CommunityState extends Equatable {
  CommunityState([List props = const[]]) : super(props);
}

class InitialCommunityState extends CommunityState { }

//todo add other states