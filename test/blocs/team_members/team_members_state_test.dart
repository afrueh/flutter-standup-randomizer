import 'package:flutter_test/flutter_test.dart';
import 'package:standup_randomizer/blocs/blocs.dart';
import 'package:standup_randomizer/models/models.dart';

main() {
  group('TeamMembersStateNotLoaded', () {
    test('equality check works', () {
      final teamMemberOriginal = TeamMembersStateNotLoaded();
      final teamMemberSame = TeamMembersStateNotLoaded();

      expect(teamMemberOriginal == teamMemberSame, isTrue);
    });

    test('toString prints expected result', () {
      final teamMemberState = TeamMembersStateNotLoaded();
      expect(teamMemberState.toString(), 'TeamMembersStateNotLoaded');
    });
  });

  group('TeamMembersStateLoaded', () {
    test('equality check works', () {
      final teamMember1 = TeamMember(name: 'John Doe');
      final teamMember2 = TeamMember(name: 'Jane Doe');
      final teamMemberStateOriginal =
          TeamMembersStateLoaded(teamMembers: [teamMember1]);
      final teamMemberStateSame =
          TeamMembersStateLoaded(teamMembers: [teamMember1]);
      final teamMemberStateOther =
          TeamMembersStateLoaded(teamMembers: [teamMember1, teamMember2]);

      expect(teamMemberStateOriginal == teamMemberStateSame, isTrue);
      expect(teamMemberStateOriginal == teamMemberStateOther, isFalse);
    });

    test('toString prints expected result', () {
      final teamMember = TeamMember(name: 'John Doe');
      final teamMembersState =
          TeamMembersStateLoaded(teamMembers: [teamMember]);
      expect(
        teamMembersState.toString(),
        'TeamMembersStateLoaded([TeamMember(John Doe)])',
      );
    });
  });
}
