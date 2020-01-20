import 'package:bloc/bloc.dart';
import 'package:debt_collector/db/database_helper.dart';
import 'package:debt_collector/login/bloc.dart';
import 'package:debt_collector/model/user.dart';
import 'package:debt_collector/utils/app_strings.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  @override
  InitialLoginState get initialState => InitialLoginState(null, null);

  final passwordMinLength = 6;
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is BackButtonEvent) {
      yield BackButtonState();
    } else if (event is SubmitLoginEvent) {
      yield LoginInProgressState();
      final userExists = await _checkCredentials(event.login, event.password);
      if (userExists) {
        yield LoginResponseState(userExists);
      } else {
        yield InitialLoginState(AppStrings.incorrectEmailOrPasswordMessage, null);
      }
    } else if (event is RedirectToRegisterPageEvent) {
      yield RedirectToRegisterPageState();
    }
  }

  Future<bool> _checkCredentials(String login, String password) async {
    final users = await _databaseHelper.queryAllUsersRows();
    for (int i = 0; i < users.length; i++) {
      User user = User.fromMap(users[i]);
      if (user.login == login && user.password == password) {
        return true;
      }
    }
    return false;
  }
}