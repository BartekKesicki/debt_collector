import 'package:debt_collector/home/home_page_result_action.dart';
import 'package:debt_collector/settings/bloc.dart';
import 'package:debt_collector/utils/app_strings.dart';
import 'package:debt_collector/utils/app_styles.dart';
import 'package:debt_collector/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.homePageResultAction}) : super(key: key);

  final HomePageResultAction homePageResultAction;

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final settingsBloc = SettingsBloc();

  HomePageResultAction _homePageResultAction;

  @override
  Widget build(BuildContext context) {
    _homePageResultAction = widget.homePageResultAction;
    return BlocListener(
      bloc: settingsBloc,
      listener: (BuildContext context, SettingsState state) {
        if (state is LogoutSettingsState) {
          redirectToLogoutPage(context);
        }
      },
      child: BlocProvider(
          builder: (BuildContext context) => settingsBloc,
          child: BlocBuilder(
            bloc: settingsBloc,
            builder: (BuildContext context, SettingsState settingsState) {
              return _buildMainWidget();
            },
          )
      ),
    );
  }

  Widget _buildMainWidget() {
    return Center(
      child: AppStyles.withAllPadding(AppWidgets.createRaisedButton(AppStrings.settingsPageLogoutLabel, () {
        showAlertDialog();
      }), 20.0),
    );
  }

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppWidgets.createAlertDialog(context,
              AppStrings.doYouWantToLogoutMessage, AppStrings.yes, AppStrings.no, () {
                Navigator.pop(context);
                settingsBloc.dispatch(PerformLogoutEvent());
              }, () {
                Navigator.pop(context);
              });
        });
  }

  redirectToLogoutPage(BuildContext context) {
    _homePageResultAction.onLogoutClicked();
  }
}