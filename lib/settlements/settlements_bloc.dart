import 'package:debt_collector/settlements/bloc.dart';
import 'package:bloc/bloc.dart';

class SettlementsBloc extends Bloc<SettlementsEvent, SettlementsState> {
  @override
  SettlementsState get initialState => InitialSettlementsState();

  @override
  Stream<SettlementsState> mapEventToState(SettlementsEvent event) async* {
    yield InitialSettlementsState();
    //todo fill other states
  }

}