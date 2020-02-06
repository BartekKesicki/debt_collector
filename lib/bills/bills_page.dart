import 'package:debt_collector/bills/bills_bloc.dart';
import 'package:debt_collector/bills/bills_state.dart';
import 'package:debt_collector/bills/new_debt/bloc.dart';
import 'package:debt_collector/bills/new_loan/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsPage extends StatefulWidget {

  BillsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BillsPageState();

}

class _BillsPageState extends State<BillsPage> {

  final _billsBloc = BillsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: _billsBloc,
        listener: (BuildContext context, BillsState billsState) {
          if (billsState is RedirectToNewLoanState) {
            _redirectToNewLoanPage(context);
          } else if (billsState is RedirectToNewDebtState) {
            _redirectToNewDebtPage(context);
          }
        },
        child: BlocProvider(
          builder: (BuildContext context) => _billsBloc,
          child: BlocBuilder(
              bloc: _billsBloc,
              builder : (BuildContext context, BillsState billsState) {
                if (billsState is InitialBillsState) {
                  return _buildInitialBillsPage();
                } else {
                  return Container();
                }
              }
          ),
        ),
      )
    );
  }

  Widget _buildInitialBillsPage() {
    //todo fill page
    return Container();
  }

  void _redirectToNewDebtPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewDebtPage()));
  }

  void _redirectToNewLoanPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewLoanPage()));
  }
}