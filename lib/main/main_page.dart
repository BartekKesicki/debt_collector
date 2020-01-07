import 'package:debt_collector/main/bloc.dart';
import 'package:debt_collector/utils/app_dimens.dart';
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
    return SingleChildScrollView(
        child: BlocProvider(
          builder: (BuildContext context) => _mainBloc,
          child: BlocBuilder(
            bloc: _mainBloc,
            builder: (BuildContext context, MainState state) {
              if (state is ScreenMainState) {
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
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(right: AppDimens.widgetMediumPadding, top: AppDimens.widgetMediumPadding),
            child: AppWidgets.buildWelcomeText("Welcome $username"),
          ),
        )
      ],
    );
  }

}