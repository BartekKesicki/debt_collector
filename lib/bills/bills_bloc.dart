import 'package:debt_collector/bills/bills_event.dart';
import 'package:bloc/bloc.dart';
import 'bills_state.dart';

class BillsBloc extends Bloc<BillsEvent, BillsState> {
  @override
  BillsState get initialState => InitialBillsState();

  @override
  Stream<BillsState> mapEventToState(BillsEvent event) async* {
    yield InitialBillsState();
    //todo check otehr states
  }

}