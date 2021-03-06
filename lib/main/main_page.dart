import 'package:debt_collector/main/bloc.dart';
import 'package:debt_collector/utils/app_dimens.dart';
import 'package:debt_collector/utils/app_strings.dart';
import 'package:debt_collector/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _mainBloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    //todo fill page
    return BlocProvider(
      builder: (BuildContext context) => _mainBloc,
      child: BlocBuilder(
        bloc: _mainBloc,
        builder: (BuildContext context, MainState state) {
          if (state is InitialScreenMainState) {
            _mainBloc.dispatch(ScreenMainEvent());
          } else if (state is ScreenMainState) {
            return _buildMainWidget(state);
          }
          //todo check states
          return Container();
        },
      ),
    );
  }

  Widget _buildMainWidget(ScreenMainState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildUserNameLabel(state.userName),
        Column(
          children: <Widget>[
            _buildSaldoLabel(state.saldo),
            _buildClientsQuantityLabel(state.clients),
          ],
        ),
        _buildStatisticsSection(state.totalDebts, state.totalLoans, state.debtInterests, state.loanInterests)
      ],
    );
  }

  Widget _buildUserNameLabel(String username) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(right: AppDimens.widgetMediumPadding, top: AppDimens.widgetMediumPadding),
        child: AppWidgets.buildWelcomeText("Welcome $username"),
      ),
    );
  }

  Widget _buildSaldoLabel(String saldo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: AppWidgets.buildBigLabel("SALDO: $saldo"),
      ),
    );
  }

  Widget _buildClientsQuantityLabel(String clients) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: AppWidgets.buildMediumLabel("Total clients: $clients"),
      ),
    );
  }

  Widget _buildStatisticsSection(String totalDebts, String totalLoans, String debtInterests, String loanInterests) {
    //todo fill data
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          child: Center(child: Text("${AppStrings.homeStatisticsDebtsLabel} $totalDebts")),
          color: Colors.green,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Center(child: Text("${AppStrings.homeStatisticsLoansLabel} $totalLoans")),
          color: Colors.blue,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Center(child: Text("${AppStrings.homeStatisticsDebtsInterestLabel} $debtInterests")),
          color: Colors.red,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Center(child: Text("${AppStrings.homeStatisticsLoansInterestLabel} $loanInterests")),
          color: Colors.cyan,
        ),
      ],
    );
  }
}