import 'package:equatable/equatable.dart';

abstract class BillsEvent extends Equatable {
    BillsEvent([List props = const []]) : super(props);
}

class InitialBillsEvent extends BillsEvent { }

//todo add other events