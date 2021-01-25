part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class InitialAppState extends AppState {}

class SuccessAppState extends AppState {}

class FailureAppState extends AppState {}
