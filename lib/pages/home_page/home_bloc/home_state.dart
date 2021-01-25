part of 'home_bloc.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<CardModel> cards;

  SuccessHomeState({this.cards});
}

class FailureHomeState extends HomeState {
  final String error;

  FailureHomeState({this.error});
}

class FailureHomeJWTState extends HomeState {}
