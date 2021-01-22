import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_randomizer/blocs/blocs.dart';
import 'package:standup_randomizer/models/models.dart';

class TeamMembersBloc extends Bloc<TeamMembersEvent, TeamMembersState> {
  List<TeamMember> _teamMembers = [];
  TeamMembersBloc() : super(TeamMembersStateNotLoaded());

  @override
  Stream<TeamMembersState> mapEventToState(TeamMembersEvent event) async* {
    if (event is TeamMembersEventLoadData) {
      yield TeamMembersStateLoaded(teamMembers: _teamMembers);
    } else if (event is TeamMembersEventAddMember) {
      _teamMembers.add(TeamMember(name: event.name));
      yield TeamMembersStateLoaded(teamMembers: _teamMembers);
    } else if (event is TeamMembersEventRemoveAll) {
      _teamMembers.clear();
      yield TeamMembersStateLoaded(teamMembers: _teamMembers);
    }
  }
}
