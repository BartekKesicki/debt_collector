import 'package:debt_collector/home/home_page.dart';
import 'package:debt_collector/login/bloc.dart';
import 'package:debt_collector/register/register_page.dart';
import 'package:debt_collector/utils/app_dimens.dart';
import 'package:debt_collector/utils/app_strings.dart';
import 'package:debt_collector/utils/app_styles.dart';
import 'package:debt_collector/utils/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debt Collector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginBloc = LoginBloc();
  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocListener(
            listener: (BuildContext context, LoginState loginState) {
              if (loginState is BackButtonState) {
                //do nothing
              } else if (loginState is LoginResponseState) {
                redirectToHomePage(context);
              } else if (loginState is RedirectToRegisterPageState) {
                redirectToRegisterPage(context);
              }
            },
            bloc: loginBloc,
            child: BlocProvider(
              builder: (BuildContext context) => loginBloc,
              child: BlocBuilder(
                bloc: loginBloc,
                builder: (BuildContext context, LoginState loginState) {
                  if (loginState is LoginInProgressState) {
                    return buildLoginInProgressState();
                  } else if (loginState is InitialLoginState) {
                    return buildColumnWithData(
                        context,
                        loginState.usernameErrorMessage,
                        loginState.passwordErrorMessage);
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildColumnWithData(BuildContext context, String userErrorTextMessage,
      String passwordErrorTextMessage) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppStyles.withTopBelowPadding(
            AppWidgets.buildTopLabel(AppStrings.loginTopLabel),
            AppDimens.topBelowLabelsValue),
        AppStyles.withAllPadding(
            TextField(
              controller: _userTextController,
              onChanged: (value) { },
              keyboardType: TextInputType.emailAddress,
              decoration: AppStyles.createTextFieldDecoration(
                  AppStrings.email,
                  userErrorTextMessage,
                  null),
            ),
            AppDimens.textInputPaddingAllDirections),
        AppStyles.withAllPadding(
            TextField(
              keyboardType: TextInputType.text,
              controller: _passwordTextController,
              onChanged: (value) { },
              obscureText: true,
              decoration: AppStyles.createTextFieldDecoration(
                  AppStrings.password,
                  passwordErrorTextMessage,
                  null),
            ),
            AppDimens.textInputPaddingAllDirections),
        AppWidgets.createRaisedButton(AppStrings.submit, () {
          submit(context);
        }),
        AppStyles.withAllPadding(AppWidgets.createRaisedButton(AppStrings.register, () {
          final loginBloc = BlocProvider.of<LoginBloc>(context);
          loginBloc.dispatch(RedirectToRegisterPageEvent());
        }), 20.0)
      ],
    );
  }

  Widget buildLoginInProgressState() {
    return Center(
        child: Column(
      children: <Widget>[
        CircularProgressIndicator(),
        Text(AppStrings.loadingInProgress)
      ],
    ));
  }

  Future<bool> _onWillPop() async{
    loginBloc.dispatch(BackButtonEvent());
    return true;
  }

  redirectToHomePage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }

  redirectToRegisterPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void submit(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBloc.dispatch(SubmitLoginEvent(
        _userTextController.text, _passwordTextController.text));
  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.dispose();
    _userTextController.dispose();
    _passwordTextController.dispose();
  }
}
