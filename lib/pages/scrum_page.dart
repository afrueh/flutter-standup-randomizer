import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_randomizer/blocs/blocs.dart';
import 'package:standup_randomizer/widgets/widgets.dart';

class ScrumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(child: BlocBuilder<TeamMembersBloc, TeamMembersState>(
        builder: ((context, state) {
          if (state is TeamMembersStateLoaded) {
            return CircularList(
              centerWidget: TeamMemberWidget(name: 'Scrum master'),
              children: List.generate(state.teamMembers.length, (index) {
                return TeamMemberWidget(
                  name: state.teamMembers[index].name,
                );
              }),
            );
          } else {
            return Text('Loading');
          }
        }),
      )),
    );
  }
}
