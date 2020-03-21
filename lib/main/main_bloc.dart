import 'package:bloc/bloc.dart';
import 'package:debt_collector/db/database_helper.dart';
import 'package:debt_collector/db/shared_preferences_keys.dart';
import 'package:debt_collector/model/bill.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  @override
  MainState get initialState => InitialScreenMainState();

  final _db = DatabaseHelper.instance;

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    final _debts = await _retrieveAllBills();
    final _userName = await _getUserName();
    final _saldo = await _calculateSaldo(_debts);
    final _totalDebts = await _calculateTotalDebts(_debts);
    final _totalLoans = await _calculateTotalLoans(_debts);
    //todo fill states
    yield ScreenMainState(_userName, _saldo.toString(), _totalDebts.toString(), _totalLoans.toString());
  }

  Future<String> _getUserName() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final _userName = _sharedPreferences.getString(SharedPreferencesKeys.USER_ID_SHARED_PREFERENCES_KEY);
    return _userName;
  }

  Future<List<Bill>> _retrieveAllBills() async {
    List<Bill> _retrievedBills = List();
    final _bills = await _db.getAllBills();
    for (int i = 0; i < _bills.length; i++) {
      Bill bill = Bill.fromMap(_bills[i]);
      _retrievedBills.add(bill);
    }
    return _retrievedBills;
  }

  Future<double> _calculateSaldo(List<Bill> bills) async {
    double saldo = 0;
    for (int i = 0; i < bills.length; i++) {
      saldo += bills[i].value;
    }
    return saldo;
  }

  Future<int> _calculateTotalDebts(List<Bill> bills) async {
    int debtsQuantity = 0;
    for (int i = 0; i < bills.length; i++) {
      if (bills[i].value < 0) {
        debtsQuantity++;
      }
    }
    return debtsQuantity;
  }

  Future<int> _calculateTotalLoans(List<Bill> bills) async {
    int loansQuantity = 0;
    for (int i = 0; i < bills.length; i++) {
      if (bills[i].value > 0) {
        loansQuantity++;
      }
    }
    return loansQuantity;
  }

}