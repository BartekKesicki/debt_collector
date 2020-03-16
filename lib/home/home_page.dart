import 'package:debt_collector/bills/bills_page.dart';
import 'package:debt_collector/bills/new_debt/new_debt_page.dart';
import 'package:debt_collector/bills/new_loan/new_loan_page.dart';
import 'package:debt_collector/community/bloc.dart';
import 'package:debt_collector/db/shared_preferences_keys.dart';
import 'package:debt_collector/home/bloc.dart';
import 'package:debt_collector/home/home_page_result_action.dart';
import 'package:debt_collector/home/home_sub_page_enum.dart';
import 'package:debt_collector/main/bloc.dart';
import 'package:debt_collector/settings/bloc.dart';
import 'package:debt_collector/settlements/settlememts_page.dart';
import 'package:debt_collector/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageResultAction {

  static int selectedPos = 2;
  CircularBottomNavigationController _navigationController = CircularBottomNavigationController(selectedPos);

  List<TabItem> tabItems = List.of([
    TabItem(Icons.assessment, AppStrings.homePageBillsLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.assignment_late, AppStrings.homePageSettlementLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.home, AppStrings.homePageHomeLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.people, AppStrings.homePageCommunityLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.settings, AppStrings.homePageSettingsLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
  ]);

  final _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          child: BlocProvider(
              builder: (BuildContext context) => _homeBloc,
              child: BlocBuilder(
                bloc: _homeBloc,
                builder: (BuildContext context, HomeState homeState) {
                  if (homeState is BackButtonState) {
                    //do nothing
                  } else if (homeState is NewDebtInitialState) {
                    return NewDebtPage();
                  } else if (homeState is NewLoanInitialState) {
                    return NewLoanPage();
                  } else if (homeState is HomeInitialState) {
                    return MainPage();
                  } else if (homeState is CommunityPageState) {
                    return CommunityPage();
                  } else if (homeState is SettlementsPageState) {
                    return SettlementsPage();
                  } else if (homeState is SettingsInitialState) {
                    return SettingsPage(homePageResultAction: this);
                  } else if (homeState is BillsPageState) {
                    return BillsPage();
                  }
                  return MainPage();
                },
              ),
          ),
        ),
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          selectedCallback: (int selectedPos) {
            setState(() {
              _navigationController.value = selectedPos;
              if (selectedPos == HomeSubPageEnum.BILLS.index) {
                _homeBloc.dispatch(InitBillsPageEvent());
              } else if (selectedPos == HomeSubPageEnum.SETTLEMENT.index) {
                _homeBloc.dispatch(InitSettlementsPageEvent());
              } else if (selectedPos == HomeSubPageEnum.HOME.index) {
                _homeBloc.dispatch(InitHomePageEvent());
              } else if (selectedPos == HomeSubPageEnum.COMMUNITY.index) {
                _homeBloc.dispatch(InitCommunityPageEvent());
              } else if (selectedPos == HomeSubPageEnum.SETTINGS.index) {
                _homeBloc.dispatch(InitSettingsPageEvent());
              }
            });
          },
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    _homeBloc.dispatch(BackButtonEvent());
    return true;
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  void onLogoutClicked() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(SharedPreferencesKeys.USER_ID_SHARED_PREFERENCES_KEY, "");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}