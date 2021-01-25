import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:notroguery/constants/constants.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialAppState());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is InitialAppEvent) {
      final _storage = FlutterSecureStorage();

      final jwt = await _storage.read(key: Constants.jwt);

      if (jwt == null) {
        yield FailureAppState();
      } else {
        yield SuccessAppState();
      }
    }
  }
}
