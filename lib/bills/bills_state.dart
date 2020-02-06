import 'package:equatable/equatable.dart';

abstract class BillsState extends Equatable {
  BillsState([List props = const[]]) : super(props);
}

class InitialBillsState extends BillsState { }

class RedirectToNewLoanState extends BillsState { }

class RedirectToNewDebtState extends BillsState { }

//todo add other states