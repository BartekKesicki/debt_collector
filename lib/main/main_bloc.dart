import 'package:bloc/bloc.dart';
import 'package:debt_collector/db/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  @override
  MainState get initialState => InitialScreenMainState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    final _userName = await _getUserName();
    //todo fill states
    yield ScreenMainState(_userName);
  }

  Future<String> _getUserName() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final _userName = _sharedPreferences.getString(SharedPreferencesKeys.USER_ID_SHARED_PREFERENCES_KEY);
    return _userName;
  }

}