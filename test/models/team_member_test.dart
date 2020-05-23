import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:standup_randomizer/models/models.dart';

main() {
  group('TeamMember', () {
    test('decodes correctly from JSON', () {
      final jsonString = '{"name": "John Doe"}';
      final json = jsonDecode(jsonString);

      final teamMember = TeamMember.fromJson(json);

      expect(teamMember, isNotNull);
      expect(teamMember.name, 'John Doe');
    });

    test('decodes invalid JSON teamMember with NULL name', () {
      final jsonString = '{"invalidKey": "Some Value"}';
      final json = jsonDecode(jsonString);

      final teamMember = TeamMember.fromJson(json);

      expect(teamMember, isNotNull);
      expect(teamMember.name, isNull);
    });

    test('encodes correctly to JSON', () {
      final jsonString = '{"name": "John Doe"}';
      final json = jsonDecode(jsonString);

      final teamMember = TeamMember(name: 'John Doe');

      expect(teamMember.toJson(), json);
    });

    test('equality check works', () {
      final teamMemberOriginal = TeamMember(name: 'John Doe');
      final teamMemberSame = TeamMember(name: 'John Doe');
      final teamMemberDifferent = TeamMember(name: 'Jane Doe');

      expect(teamMemberOriginal == teamMemberSame, isTrue);
      expect(teamMemberOriginal == teamMemberDifferent, isFalse);
    });

    test('toString prints expected result', () {
      final teamMember = TeamMember(name: 'John Doe');
      expect(teamMember.toString(), 'TeamMember(John Doe)');
    });
  });
}
