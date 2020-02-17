import 'package:debt_collector/home/bloc.dart';
import 'package:bloc/bloc.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  @override
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is BackButtonEvent) {
      yield BackButtonState();
    } else if (event is InitNewDebtPageEvent) {
      yield NewDebtInitialState();
    } else if (event is InitNewLoanPageEvent) {
      yield NewLoanInitialState();
    } else if (event is InitMyProfilePageEvent) {
      yield MyProfileInitialState();
    } else if (event is InitHomePageEvent) {
      yield HomeInitialState();
    } else if (event is InitSettingsPageEvent) {
      yield SettingsInitialState();
    } else if (event is InitBillsPageEvent) {
      yield BillsPageState();
    } else if (event is InitSettlementsPageEvent) {
      yield SettlementsPageState();
    } else if (event is InitCommunityPageEvent) {
      yield CommunityPageState();
    }
    yield HomeInitialState();
  }

}