part of 'home_bloc.dart';

abstract class HomeEvent {}

class InitialHomeEvent extends HomeEvent {
  final int index;

  InitialHomeEvent({
    this.index,
  });
}
