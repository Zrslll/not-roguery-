part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class SuccessLoginState extends LoginState {}

class FailureLoginState extends LoginState {
  final String error;

  FailureLoginState({
    this.error,
  });
}
