import 'package:debt_collector/settings/settings_event.dart';
import 'package:debt_collector/settings/settings_state.dart';
import 'package:bloc/bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  get initialState => ScreenSettingsState();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is PerformLogoutEvent) {
      yield LogoutSettingsState();
    } else if (event is ScreenSettingsState) {
      yield ScreenSettingsState();
    }
  }
}