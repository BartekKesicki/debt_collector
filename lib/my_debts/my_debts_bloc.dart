import 'package:debt_collector/my_debts/my_debts_state.dart';
import 'package:bloc/bloc.dart';
import 'my_debts_event.dart';

class MyDebtsBloc extends Bloc<MyDebtsEvent, MyDebtsState> {
  @override
  get initialState => ScreenMyDebtsState();

  @override
  Stream<MyDebtsState> mapEventToState(MyDebtsEvent event) async* {
    yield ScreenMyDebtsState();
  }
}