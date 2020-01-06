import 'package:debt_collector/main/bloc.dart';
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
    return Scaffold(
      body: BlocProvider(
        builder: (BuildContext context) => _mainBloc,
        child: BlocBuilder(
          bloc: _mainBloc,
          builder: (BuildContext context, MainState state) {
            //todo check states
            return _buildMainWidget();
          },
        ),
      ),
    );
  }

  Widget _buildMainWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //todo build main widget
      ],
    );
  }

}