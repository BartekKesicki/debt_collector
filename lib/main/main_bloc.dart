import 'package:bloc/bloc.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  @override
  MainState get initialState => ScreenMainState("fakeuser");

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    //todo fill states
    yield ScreenMainState("fakeuser");
  }

}