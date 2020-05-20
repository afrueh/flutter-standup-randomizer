import 'package:flutter/material.dart';
import 'package:standup_randomizer/models/team_member.dart';
import 'package:standup_randomizer/widgets/widgets.dart';
import 'package:standup_randomizer/models/models.dart';

class ScrumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<TeamMember> teamMembers = [
      TeamMember(name: 'Person 1'),
      TeamMember(name: 'Person 2'),
      TeamMember(name: 'Person 3'),
      TeamMember(name: 'Person 4'),
      TeamMember(name: 'Person 5'),
      TeamMember(name: 'Person 6'),
      TeamMember(name: 'Person 7'),
    ];
    teamMembers.shuffle();

    return Background(
      child: Center(
        child: CircularList(
          centerWidget: TeamMemberWidget(name: 'Scrum master'),
          children: List.generate(teamMembers.length, (index) {
            return TeamMemberWidget(
              name: teamMembers[index].name,
            );
          }),
        ),
      ),
    );
  }
}
