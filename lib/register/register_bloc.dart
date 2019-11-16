import 'package:debt_collector/db/database_helper.dart';
import 'package:debt_collector/db/table_data_constants.dart';
import 'package:debt_collector/model/user.dart';
import 'package:debt_collector/register/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:debt_collector/utils/app_strings.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  @override
  RegisterState get initialState => InitialRegisterState(null, null, null);

  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  static final int passwordMinLength = 6;

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is SubmitRegisterEvent) {
      yield RegisterInProgressState();
      final userExists = await _checkCredentials(event.login);
      if (userExists) {
        yield InitialRegisterState(AppStrings.userAlreadyExists, null, null);
      } else {
        try {
          await insertUser(event.login, event.password);
          yield RedirectToLoginPageState();
        } catch (exception) {
          yield InitialRegisterState(AppStrings.userInsertionError, null, null);
        }
      }
    } else if (event is ValidateRegisterEvent) {
      final loginIsValid = _checkLogin(event.login);
      final passwordIsValid = _checkPassword(event.password);
      if (loginIsValid && passwordIsValid) {
        //todo register
      } else if (!loginIsValid) {
        yield InitialRegisterState(AppStrings.incorrectEmailMessage, null, null);
      } else if (!passwordIsValid) {
        yield InitialRegisterState(null, AppStrings.incorrectPasswordMessage, null);
      }
    } else if (event is RedirectToLoginPageEvent) {
      yield RedirectToLoginPageState();
    } else {
      yield InitialRegisterState(null, null, null);
    }
  }

  Future<bool> _checkCredentials(String login) async {
    final users = await dbHelper.queryAllUsersRows();
    for (int i = 0; i < (users.length - 1); i++) {
      User user = User.fromMap(users[i]);
      if (user.login == login) {
        return true;
      }
    }
    return false;
  }

  bool _checkLogin(String login) {
    bool loginValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(login);
    return loginValid;
  }

  bool _checkPassword(String password) {
    bool passwordValid = password.length >= passwordMinLength;
    return passwordValid;
  }

  Future<bool> insertUser(String login, String password) async {
    Map<String, dynamic> row = {
      TableDataConstants.userTableLoginColumnName : login,
      TableDataConstants.userTablePasswordColumnName  : password
    };
    int id = await dbHelper.insert(row);
    return id != null;
  }
}