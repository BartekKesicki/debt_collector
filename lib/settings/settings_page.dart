import 'package:debt_collector/settings/bloc.dart';
import 'package:debt_collector/utils/app_strings.dart';
import 'package:debt_collector/utils/app_styles.dart';
import 'package:debt_collector/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final settingsBloc = SettingsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (BuildContext context) => settingsBloc,
        child: BlocBuilder(
          bloc: settingsBloc,
          builder: (BuildContext context, SettingsState settingsState) {
            return AppStyles.withAllPadding(AppWidgets.createRaisedButton(AppStrings.settingsPageLogoutLabel, () {
              //todo dialog with logout prompt
            }), 20.0);
          },
        )
      ),
    );
  }

}