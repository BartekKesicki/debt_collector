import 'my_profile_event.dart';
import 'package:bloc/bloc.dart';

import 'my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  @override
  get initialState => ScreenMyProfileState();

  @override
  Stream<MyProfileState> mapEventToState(MyProfileEvent event) async* {
    yield ScreenMyProfileState();
  }
}