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
      'emits [NotLoaded, Loaded with TeamMembers] when LoadData event is added',
      build: () async => teamMembersBloc,
      act: (bloc) => bloc.add(TeamMembersEventLoadData()),
      skip: 0,
      expect: [
        TeamMembersStateNotLoaded(),
        TeamMembersStateLoaded(teamMembers: [
          TeamMember(name: 'Person 1'),
          TeamMember(name: 'Person 2'),
          TeamMember(name: 'Person 3'),
          TeamMember(name: 'Person 4'),
          TeamMember(name: 'Person 5'),
          TeamMember(name: 'Person 6'),
          TeamMember(name: 'Person 7'),
          TeamMember(name: 'Person 8'),
        ]),
      ],
    );
  });
}
