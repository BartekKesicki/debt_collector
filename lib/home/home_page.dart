import 'package:debt_collector/home/bloc.dart';
import 'package:debt_collector/home/home_sub_page_enum.dart';
import 'package:debt_collector/main/bloc.dart';
import 'package:debt_collector/my_debts/bloc.dart';
import 'package:debt_collector/my_loans/bloc.dart';
import 'package:debt_collector/my_profile/bloc.dart';
import 'package:debt_collector/new_debt/bloc.dart';
import 'package:debt_collector/new_loan/bloc.dart';
import 'package:debt_collector/settings/bloc.dart';
import 'package:debt_collector/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static int selectedPos = 2;
  CircularBottomNavigationController _navigationController = CircularBottomNavigationController(selectedPos);

  List<TabItem> tabItems = List.of([
    TabItem(Icons.assessment, AppStrings.homePageBillsLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.assignment_late, AppStrings.homePageSettlementLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.home, AppStrings.homePageHomeLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.person, AppStrings.homePageCommunityLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.settings, AppStrings.homePageSettingsLabel, Colors.blue, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
  ]);

  final _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocProvider(
              builder: (BuildContext context) => _homeBloc,
              child: BlocBuilder(
                bloc: _homeBloc,
                builder: (BuildContext context, HomeState homeState) {
                  //todo change pages
                  if (homeState is BackButtonState) {
                    //do nothing
                  } else if (homeState is NewDebtInitialState) {
                    return NewDebtPage();
                  } else if (homeState is NewLoanInitialState) {
                    return NewLoanPage();
                  } else if (homeState is HomeInitialState) {
                    return MainPage();
                  } else if (homeState is MyProfileInitialState) {
                    return MyProfilePage();
                  } else if (homeState is MyDebtsInitialState) {
                    return MyDebtsPage();
                  } else if (homeState is MyLoansInitialState) {
                    return MyLoansPage();
                  } else if (homeState is SettingsInitialState) {
                    return SettingsPage();
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
}