import 'package:debt_collector/bills/bills_bloc.dart';
import 'package:debt_collector/bills/bills_state.dart';
import 'package:debt_collector/bills/new_debt/bloc.dart';
import 'package:debt_collector/bills/new_loan/bloc.dart';
import 'package:debt_collector/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsPage extends StatefulWidget {

  BillsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BillsPageState();

}

class _BillsPageState extends State<BillsPage> {

  final _billsBloc = BillsBloc();
  final _monthNames = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE",
    "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"];

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
                return _buildInitialBillsPage();
              }
          ),
        ),
      )
    );
  }

  Widget _buildInitialBillsPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildPeriodTopLabel(),
//        Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            _buildPeriodTopLabel(),
//
//          ],
//        ),
        //todo next widgets
      ],
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

  void _redirectToNewDebtPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewDebtPage()));
  }

  void _redirectToNewLoanPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewLoanPage()));
  }
}