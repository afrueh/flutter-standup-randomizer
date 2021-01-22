import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_randomizer/blocs/blocs.dart';

class DailyBloc extends Bloc<DailyEvent, DailyState> {
  final TeamMembersBloc teamMembersBloc;

  DailyBloc({@required this.teamMembersBloc}) : super(DailyStateNotStarted());

  @override
  Stream<DailyState> mapEventToState(DailyEvent event) async* {
    if (event is DailyEventStart) {
      _shuffleTeamMemberOrder();
      yield DailyStateStarted();
    } else if (event is DailyEventStop) {
      yield DailyStateNotStarted();
    }
  }

  void _shuffleTeamMemberOrder() {
    teamMembersBloc.add(TeamMembersEventShuffleOrder());
  }
}
