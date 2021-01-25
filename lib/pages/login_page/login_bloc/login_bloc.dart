import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:notroguery/constants/constants.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  final _storage = FlutterSecureStorage();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is InitialLoginEvent) {
      final res = await http.post(
        Constants.server_login_address,
        body: {
          Constants.username: event.username,
          Constants.password: event.password,
        },
      );

      if (res.statusCode == Constants.server_response_200) {
        _storage.write(key: Constants.jwt, value: res.body);

        yield SuccessLoginState();
      } else {
        yield FailureLoginState(error: res.statusCode.toString());
      }
    }
  }
}
