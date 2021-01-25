import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notroguery/app/app.dart';

void main() {
  runApp(
    EasyLocalization(
      child: App(),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
    ),
  );
}
