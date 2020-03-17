import 'package:debt_collector/main/bloc.dart';
import 'package:debt_collector/utils/app_dimens.dart';
import 'package:debt_collector/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_format/date_format.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _mainBloc = MainBloc();
  final _monthNames = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE",
    "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"];

  @override
  Widget build(BuildContext context) {
    //todo fill page
    return SingleChildScrollView(
        child: BlocProvider(
          builder: (BuildContext context) => _mainBloc,
          child: BlocBuilder(
            bloc: _mainBloc,
            builder: (BuildContext context, MainState state) {
              if (state is InitialScreenMainState) {
                _mainBloc.dispatch(ScreenMainEvent());
              } else if (state is ScreenMainState) {
                return _buildMainWidget(state.userName);
              }
              //todo check states
              return Container();
            },
          ),
        ),
    );
  }

  Widget _buildMainWidget(String username) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildUserNameLabel(username),
        _buildPeriodTopLabel()
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

  Widget _buildPeriodTopLabel() {
    final now = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: AppWidgets.buildTitleLabel("${_monthNames[now.month - 1]} ${now.year}"),
      ),
    );
  }

}