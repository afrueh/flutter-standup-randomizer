import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:standup_randomizer/blocs/blocs.dart';
import 'package:standup_randomizer/models/models.dart';

main() {
  group('TeamMembersBloc', () {
    TeamMembersBloc teamMembersBloc;

    setUp(() {
      teamMembersBloc = TeamMembersBloc();
    });

    tearDown(() {
      teamMembersBloc?.close();
    });

    test('verify initial state is NotLoaded', () {
      expect(teamMembersBloc.state, TeamMembersStateNotLoaded());
    });

    test('close does not emit new states', () {
      expectLater(
        teamMembersBloc,
        emitsInOrder([emitsDone]),
      );
      teamMembersBloc.close();
    });

    blocTest<TeamMembersBloc, TeamMembersState>(
      'emits [Loaded with empty TeamMembers] when LoadData event is added',
      build: () => teamMembersBloc,
      act: (bloc) => bloc.add(TeamMembersEventLoadData()),
      skip: 0,
      expect: [
        TeamMembersStateLoaded(teamMembers: []),
      ],
    );

    blocTest<TeamMembersBloc, TeamMembersState>(
      'emits [Loaded with given TeamMember] when AddMemeber event is called',
      build: () => teamMembersBloc,
      act: ((bloc) {
        bloc.add(TeamMembersEventAddMember(name: 'John Doe'));
        return bloc.add(TeamMembersEventAddMember(name: 'Jane Doe'));
      }),
      skip: 0,
      expect: [
        TeamMembersStateLoaded(teamMembers: [
          TeamMember(name: 'John Doe'),
        ]),
        TeamMembersStateLoaded(teamMembers: [
          TeamMember(name: 'John Doe'),
          TeamMember(name: 'Jane Doe'),
        ]),
      ],
    );
  });
}
