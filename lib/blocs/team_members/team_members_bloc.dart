import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_randomizer/blocs/blocs.dart';
import 'package:standup_randomizer/models/models.dart';

class TeamMembersBloc extends Bloc<TeamMembersEvent, TeamMembersState> {
  TeamMembersBloc() {
    add(TeamMembersEventLoadData());
  }

  @override
  TeamMembersState get initialState => TeamMembersStateNotLoaded();

  @override
  Stream<TeamMembersState> mapEventToState(TeamMembersEvent event) async* {
    if (event is TeamMembersEventLoadData) {
      yield TeamMembersStateLoaded(teamMembers: _loadTeamMembers());
    }
  }

  List<TeamMember> _loadTeamMembers() {
    List<TeamMember> teamMembersList = [
      TeamMember(name: 'Person 1'),
      TeamMember(name: 'Person 2'),
      TeamMember(name: 'Person 3'),
      TeamMember(name: 'Person 4'),
      TeamMember(name: 'Person 5'),
      TeamMember(name: 'Person 6'),
      TeamMember(name: 'Person 7'),
      TeamMember(name: 'Person 8'),
    ];
    teamMembersList.shuffle();
    return teamMembersList;
  }
}
