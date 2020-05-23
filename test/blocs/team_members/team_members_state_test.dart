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
      final teamMemberOriginal =
          TeamMembersStateLoaded(teamMembers: [teamMember1]);
      final teamMemberSame = TeamMembersStateLoaded(teamMembers: [teamMember1]);
      final teamMemberOther =
          TeamMembersStateLoaded(teamMembers: [teamMember2]);

      expect(teamMemberOriginal == teamMemberSame, isTrue);
      expect(teamMemberOriginal == teamMemberOther, isFalse);
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
