import 'package:debt_collector/register/bloc.dart';
import 'package:bloc/bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  @override
  RegisterState get initialState => InitialRegisterState(null);

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is SubmitRegisterEvent) {
      yield RegisterInProgressState();
    } else if (event is ValidateRegisterEvent) {
      //todo check credentials
      yield InitialRegisterState(null);
    } else if (event is RedirectToLoginPageEvent) {
      yield RedirectToLoginPageState();
    } else {
      yield InitialRegisterState(null);
    }
  }
}