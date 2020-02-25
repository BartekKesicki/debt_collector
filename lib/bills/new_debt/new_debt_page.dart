import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_debt_bloc.dart';
import 'new_debt_state.dart';

class NewDebtPage extends StatefulWidget {
  NewDebtPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewDebtPageState();
}

class _NewDebtPageState extends State<NewDebtPage> {

  final _newDebtBloc = NewDebtBloc();

  @override
  Widget build(BuildContext context) {
    //todo fill page
    return BlocProvider(
      builder: (BuildContext context) => _newDebtBloc,
      child: BlocBuilder(
        bloc: _newDebtBloc,
        builder: (BuildContext context, NewDebtState newDebtState) {
          return Container();
        },
      ),
    );
  }

}