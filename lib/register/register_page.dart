
import 'package:debt_collector/register/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);


  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final loginBloc = RegisterBloc();
  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (BuildContext context) => loginBloc,
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          padding: EdgeInsets.all(16.0),
          child: BlocBuilder(
            bloc: loginBloc,
            builder: (BuildContext context, RegisterState registerState) {
              //todo build form
              return Container();
            },
          ),
        ),
      ),
    );
  }
}