import 'package:equatable/equatable.dart';

abstract class DailyState extends Equatable {
  @override
  List<Object> get props => [];
}

class DailyStateNotStarted extends DailyState {}

class DailyStateStarted extends DailyState {}
