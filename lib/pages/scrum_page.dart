import 'package:flutter/material.dart';
import 'package:standup_randomizer/widgets/widgets.dart';

class ScrumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
        child: CircularList(
          centerWidget: TeamMember(name: 'Scrum master'),
          children: List.generate(8, (index) {
            return TeamMember(
              name: 'Person $index',
            );
          }),
        ),
      ),
    );
  }
}
