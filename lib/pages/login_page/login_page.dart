import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notroguery/constants/localization.dart';
import 'package:notroguery/pages/home_page/home_page.dart';
import 'package:notroguery/pages/login_page/login_bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  void _showHomePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  void _displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.logIn),
      ),
      body: BlocProvider(
        create: (BuildContext context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is SuccessLoginState) _showHomePage(context);
            if (state is FailureLoginState)
              _displayDialog(
                context,
                Localization.an_error_occurred,
                state.error,
              );
          },
          builder: (context, state) => _bodyBuilder(context),
        ),
      ),
    );
  }
}

Widget _bodyBuilder(BuildContext context) {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: Localization.username,
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: Localization.password,
          ),
        ),
        SizedBox(height: 20.0),
        RaisedButton(
          onPressed: () => BlocProvider.of<LoginBloc>(context).add(
            InitialLoginEvent(
              username: usernameController.text,
              password: passwordController.text,
            ),
          ),
          child: Text(Localization.logIn),
        ),
      ],
    ),
  );
}
