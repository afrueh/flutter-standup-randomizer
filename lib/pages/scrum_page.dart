import 'dart:math';

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
              centerWidget: state.teamMembers.length > 0
                  ? ScrumCenterWidget()
                  : ScrumCenterEmptyWidget(),
              children: List.generate(state.teamMembers.length, (index) {
                return TeamMemberWidget(
                  name: state.teamMembers[index].name,
                  isActive: index == 0,
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

class ScrumCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final minSize = min(size.width, size.height);

    return Container(
      width: minSize * 0.2,
      decoration: new BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.rotate_right,
          color: Theme.of(context).colorScheme.onSecondary,
          size: minSize * 0.15,
        ),
      ),
    );
  }
}

class ScrumCenterEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Please add a team member',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
