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
    final _saldo = _calculateSaldo(_debts);
    final _totalDebts = _calculateTotalDebts(_debts);
    final _totalLoans = _calculateTotalLoans(_debts);
    final _totalDebtInterests = _calculateTotalDebtInterests(_debts);
    final _totalLoanInterests = _calculateTotalLoanInterests(_debts);
    //todo fill states
    yield ScreenMainState(_userName, _saldo.toString(), _totalDebts.toString(), _totalLoans.toString(), _totalDebtInterests.toString(), _totalLoanInterests.toString());
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

  double _calculateSaldo(List<Bill> bills) {
    double saldo = 0;
    for (int i = 0; i < bills.length; i++) {
      saldo += bills[i].value;
    }
    return saldo;
  }

  int _calculateTotalDebts(List<Bill> bills) {
    int debtsQuantity = 0;
    for (int i = 0; i < bills.length; i++) {
      if (bills[i].value < 0) {
        debtsQuantity++;
      }
    }
    return debtsQuantity;
  }

  int _calculateTotalLoans(List<Bill> bills) {
    int loansQuantity = 0;
    for (int i = 0; i < bills.length; i++) {
      if (bills[i].value > 0) {
        loansQuantity++;
      }
    }
    return loansQuantity;
  }

  double _calculateTotalDebtInterests(List<Bill> bills) {
    double debtInterests = 0.0;
    for (int i = 0; i < bills.length; i++) {
      if (bills[i].value < 0 && bills[i].interest != 0) {
        debtInterests += _calculateInterests(bills[i].creationTime, bills[i].interest, bills[i].value);
      }
    }
    return debtInterests;
  }

  double _calculateTotalLoanInterests(List<Bill> bills) {
    double loanInterests = 0.0;
    for (int i = 0; i < bills.length; i++) {
      if (bills[i].value < 0 && bills[i].interest != 0) {
        loanInterests += _calculateInterests(bills[i].creationTime, bills[i].interest, bills[i].value);
      }
    }
    return loanInterests;
  }

  double _calculateInterests(int billCreationTime, double percentage, double value) {
    double interest = 0.0;
    int daysInYears = 365;
    var now = DateTime.now();
    var billCreationDate = DateTime.fromMillisecondsSinceEpoch(billCreationTime);
    var diff = now.difference(billCreationDate).inDays;
    double interestsMultiplier = diff / daysInYears;
    interest += value * percentage * interestsMultiplier;
    return interest;
  }
}