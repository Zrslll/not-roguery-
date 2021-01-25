import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notroguery/app/app_bloc/app_bloc.dart';
import 'package:notroguery/pages/home_page/home_page.dart';
import 'package:notroguery/pages/login_page/login_page.dart';
import 'package:notroguery/constants/localization.dart';
import 'package:notroguery/widgets/show_progress_indicator.dart';

class App extends StatelessWidget {
  void _showHomePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  void _showLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: Localization.kanban,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (BuildContext context) => AppBloc()
          ..add(
            InitialAppEvent(),
          ),
        child: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state is SuccessAppState) _showHomePage(context);
            if (state is FailureAppState) _showLoginPage(context);
          },
          child: Scaffold(
            body: ShowProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
