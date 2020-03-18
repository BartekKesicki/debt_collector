import 'package:bloc/bloc.dart';
import 'package:debt_collector/db/database_helper.dart';
import 'package:debt_collector/db/shared_preferences_keys.dart';
import 'package:debt_collector/model/debt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  @override
  MainState get initialState => InitialScreenMainState();

  final _db = DatabaseHelper.instance;

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    final _userName = await _getUserName();
    final _saldo = await _calculateSaldo();
    //todo fill states
    yield ScreenMainState(_userName, _saldo.toString());
  }

  Future<String> _getUserName() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final _userName = _sharedPreferences.getString(SharedPreferencesKeys.USER_ID_SHARED_PREFERENCES_KEY);
    return _userName;
  }

  Future<double> _calculateSaldo() async {
    double saldo = 0;
    final _debts = await _db.getAllDebts();
    for (int i = 0; i < _debts.length; i++) {
      Debt debt = Debt.fromMap(_debts[i]);
      saldo += debt.value;
    }
    return saldo;
  }

}