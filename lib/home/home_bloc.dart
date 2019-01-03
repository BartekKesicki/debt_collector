import 'package:debt_collector/home/bloc.dart';
import 'package:bloc/bloc.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield HomeInitialState();
  }

}