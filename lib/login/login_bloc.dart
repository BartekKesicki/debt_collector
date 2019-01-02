import 'package:bloc/bloc.dart';
import 'package:debt_collector/login/bloc.dart';
import 'package:debt_collector/utils/app_strings.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  @override
  InitialLoginState get initialState => InitialLoginState(null, null);

  //mocked data
  final login = "flutter.bloc@softwarehut.com";
  final pass = "Password";
  final passwordMinLength = 6;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SubmitLoginEvent) {
      yield LoginInProgressState();
      final userExists = await _checkCredentials(event.login, event.password);
      if (userExists) {
        yield LoginResponseState(userExists);
      } else {
        yield InitialLoginState(AppStrings.incorrectEmailOrPasswordMessage, null);
      }
    } else if (event is ValidateLoginEvent) {
      final emailIsValid = _validateEmail(event.login);
      final passwordIsValid = _validatePassword(event.password);
      if (emailIsValid && passwordIsValid) {
        yield InitialLoginState(null, null);
      } else if (!emailIsValid && !passwordIsValid) {
        yield InitialLoginState(AppStrings.incorrectEmailMessage, AppStrings.incorrectPasswordMessage);
      } else if (!emailIsValid) {
        yield InitialLoginState(null, null);
      } else if (!passwordIsValid) {
        yield InitialLoginState(null, AppStrings.incorrectPasswordMessage);
      }
    } else if (event is RedirectToRegisterPageEvent) {
      yield RedirectToRegisterPageState();
    }
  }

  Future<bool> _checkCredentials(String login, String password) {
    return Future.delayed(Duration(seconds: 1), () {
      return login == this.login && password == pass;
    });
  }

  bool _validateEmail(String login) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(login);
    return emailValid;
  }

  bool _validatePassword(String password) {
    return password.length > passwordMinLength;
  }
}