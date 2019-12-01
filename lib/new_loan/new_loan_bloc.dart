import 'new_loan_event.dart';
import 'new_loan_state.dart';
import 'package:bloc/bloc.dart';

class NewLoanBloc extends Bloc<NewLoanEvent, NewLoanState> {
  @override
  NewLoanState get initialState => ScreenNewLoanState();

  @override
  Stream<NewLoanState> mapEventToState(NewLoanEvent event) async* {
    yield ScreenNewLoanState();
  }

}