import 'my_loans_event.dart';
import 'my_loans_state.dart';
import 'package:bloc/bloc.dart';

class MyLoansBloc extends Bloc<MyLoansEvent, MyLoansState> {
  @override
  get initialState => ScreenMyLoansState();

  @override
  Stream<MyLoansState> mapEventToState(MyLoansEvent event) async* {
    yield ScreenMyLoansState();
  }
}