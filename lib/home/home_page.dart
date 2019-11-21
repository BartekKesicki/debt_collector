import 'package:debt_collector/home/bloc.dart';
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
          child: BlocListener(
            bloc: _homeBloc,
            listener: (BuildContext context, HomeState homeState) {
              if (homeState is BackButtonState) {
                //do nothing
              }
              //todo add behaviour
            },
            child: BlocProvider(
              builder: (BuildContext context) => _homeBloc,
              child: BlocBuilder(
                bloc: _homeBloc,
                builder: (BuildContext context, HomeState homeState) {
                  //todo fill building widgets
                  return buildMainWidget(context);
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          selectedCallback: (int selectedPos) {
            setState(() {
              //todo launch events
              _navigationController.value = selectedPos;
            });
          },
        ),
      ),
    );
  }

  void _onWillPop(){
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.dispatch(BackButtonEvent());
  }

  Widget buildMainWidget(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }
}