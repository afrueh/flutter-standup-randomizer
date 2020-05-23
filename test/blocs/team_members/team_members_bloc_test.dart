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
      expect(teamMembersBloc.initialState, TeamMembersStateNotLoaded());
      expect(teamMembersBloc.state, TeamMembersStateNotLoaded());
    });

    test('close does not emit new states', () {
      expectLater(
        teamMembersBloc,
        emitsInOrder([TeamMembersStateNotLoaded(), emitsDone]),
      );
      teamMembersBloc.close();
    });

    blocTest(
      'emits [NotLoaded, Loaded with empty TeamMembers] when LoadData event is added',
      build: () async => teamMembersBloc,
      act: (bloc) => bloc.add(TeamMembersEventLoadData()),
      skip: 0,
      expect: [
        TeamMembersStateNotLoaded(),
        TeamMembersStateLoaded(teamMembers: []),
      ],
    );

    blocTest(
      'emits [NotLoaded, Loaded with given TeamMember] when AddMemeber event is called',
      build: () async => teamMembersBloc,
      act: ((bloc) {
        bloc.add(TeamMembersEventAddMember(name: 'John Doe'));
        return bloc.add(TeamMembersEventAddMember(name: 'Jane Doe'));
      }),
      skip: 0,
      expect: [
        TeamMembersStateNotLoaded(),
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
