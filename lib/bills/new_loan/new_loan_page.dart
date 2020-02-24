import 'package:debt_collector/bills/new_loan/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewLoanPage extends StatefulWidget {
  NewLoanPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewLoanPageState();
}

class _NewLoanPageState extends State<NewLoanPage> {

  final _newLoanBloc = NewLoanBloc();

  @override
  Widget build(BuildContext context) {
    //todo fill page
    return Scaffold(
      body: BlocProvider(
        builder: (BuildContext context) => _newLoanBloc,
        child: BlocBuilder(
          bloc: _newLoanBloc,
          builder: (BuildContext context, NewLoanState newLoanState) {
            return Container();
          },
        ),
      ),
    );
  }
}