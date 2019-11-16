
import 'package:debt_collector/main.dart';
import 'package:debt_collector/register/bloc.dart';
import 'package:debt_collector/utils/app_dimens.dart';
import 'package:debt_collector/utils/app_strings.dart';
import 'package:debt_collector/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {

  RegisterPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final registerBloc = RegisterBloc();
  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener(
          listener: (BuildContext context, RegisterState registerState) {
            if (registerState is RedirectToLoginPageState) {
              redirectToLoginPage();
            }
          },
          bloc: registerBloc,
          child: BlocProvider(
            builder: (BuildContext context) => registerBloc,
            child: BlocBuilder(
                bloc: registerBloc,
                builder: (BuildContext context, RegisterState registerState) {
                  if (registerState is InitialRegisterState) {
                    return buildRegisterFormPage(context, registerState);
                  } else if (registerState is SubmitRegisterEvent) {
                    return buildRegisterInProgressWidget();
                  }
                  return buildRegisterFormPage(context, registerState);
                },
              ),
          ),
        ),
      ),
    );
  }

  Widget buildRegisterFormPage(BuildContext context, InitialRegisterState registerState) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            AppStyles.withAllPadding(Text(AppStrings.registerTopLabel), AppDimens.textInputPaddingAllDirections),
            AppStyles.withAllPadding(TextField(
              decoration: AppStyles.createTextFieldDecoration(AppStrings.email, registerState.userErrorMessage, AppStrings.email),
              controller: _userTextController,
              onChanged: (value) {
                final registerBloc = BlocProvider.of<RegisterBloc>(context);
                registerBloc.dispatch(ValidateRegisterEvent(_userTextController.text, _passwordTextController.text, _confirmPasswordTextController.text));
              },
            ), AppDimens.textInputPaddingAllDirections),
            AppStyles.withAllPadding(TextField(
              decoration: AppStyles.createTextFieldDecoration(AppStrings.password, registerState.passwordErrorMessage, AppStrings.password),
              controller: _passwordTextController,
              onChanged: (value) {
                final registerBloc = BlocProvider.of<RegisterBloc>(context);
                registerBloc.dispatch(ValidateRegisterEvent(_userTextController.text, _passwordTextController.text, _confirmPasswordTextController.text));
              },
            ), AppDimens.textInputPaddingAllDirections),
            AppStyles.withAllPadding(TextField(
              decoration: AppStyles.createTextFieldDecoration(AppStrings.confirmPassword, registerState.confirmPasswordErrorMessage, AppStrings.confirmPassword),
              controller: _confirmPasswordTextController,
              onChanged: (value) {
                final registerBloc = BlocProvider.of<RegisterBloc>(context);
                registerBloc.dispatch(ValidateRegisterEvent(_userTextController.text, _passwordTextController.text, _confirmPasswordTextController.text));
              },
            ), AppDimens.textInputPaddingAllDirections),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterInProgressWidget() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularProgressIndicator(),
            AppStyles.withAllPadding(Text(AppStrings.registerInProgress), 10.0)
          ],
        ),
      ),
    );
  }

  void redirectToLoginPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  void dispose() {
    super.dispose();
    registerBloc.dispose();
    _userTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
  }
}