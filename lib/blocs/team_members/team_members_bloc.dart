import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_randomizer/blocs/blocs.dart';
import 'package:standup_randomizer/models/models.dart';

class TeamMembersBloc extends Bloc<TeamMembersEvent, TeamMembersState> {
  List<TeamMember> _teamMembers = [];
  TeamMembersBloc() {
    _teamMembers = [
      TeamMember(name: 'Robert'),
      TeamMember(name: 'Aaron'),
      TeamMember(name: 'Dominik'),
      TeamMember(name: 'Julia'),
      TeamMember(name: 'Matthias'),
      TeamMember(name: 'Emran'),
      TeamMember(name: 'Julian'),
      TeamMember(name: 'Markus'),
    ]..shuffle();
  }

  @override
  TeamMembersState get initialState => TeamMembersStateNotLoaded();

  @override
  Stream<TeamMembersState> mapEventToState(TeamMembersEvent event) async* {
    if (event is TeamMembersEventLoadData) {
      yield TeamMembersStateLoaded(teamMembers: _teamMembers);
    } else if (event is TeamMembersEventAddMember) {
      _teamMembers.add(TeamMember(name: event.name));
      yield TeamMembersStateLoaded(teamMembers: _teamMembers);
    }
  }
}
