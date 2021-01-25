part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class InitialLoginEvent extends LoginEvent {
  final String username;

  final String password;

  InitialLoginEvent({
    this.username,
    this.password,
  });
}
