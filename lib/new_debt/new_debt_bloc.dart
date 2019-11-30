import 'new_debt_event.dart';
import 'new_debt_state.dart';
import 'package:bloc/bloc.dart';

class NewDebtBloc extends Bloc<NewDebtEvent, NewDebtState> {

  @override
  NewDebtState get initialState => ScreenNewDebtState();

  @override
  Stream<NewDebtState> mapEventToState(NewDebtEvent event) async* {
    //todo fill states
    yield ScreenNewDebtState();
  }

}