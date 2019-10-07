import 'package:debt_collector/register/bloc.dart';
import 'package:bloc/bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  @override
  RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is SubmitRegisterEvent) {
      yield RegisterInProgressState();
    } else if (event is ValidateRegisterEvent) {
      //todo add credentials
      yield InitialRegisterState();
    } else if (event is RedirectToLoginPageEvent) {
      yield RedirectToLoginPageState();
    }
    //todo null credentials
    yield InitialRegisterState();
  }

}