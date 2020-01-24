import 'package:debt_collector/community/bloc.dart';
import 'package:bloc/bloc.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  @override
  CommunityState get initialState => InitialCommunityState();

  @override
  Stream<CommunityState> mapEventToState(CommunityEvent event) async* {
    yield InitialCommunityState();
    //todo add other states
  }

}