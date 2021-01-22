import 'dart:math';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_randomizer/blocs/blocs.dart';

class ScrumMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final minSize = min(size.width, size.height);

    return FabCircularMenu(
      ringDiameter: minSize * 0.4,
      fabOpenIcon: Icon(
        Icons.menu,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      fabCloseIcon: Icon(
        Icons.close,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      ringColor: Theme.of(context).colorScheme.primary.withAlpha(140),
      children: <Widget>[
        _ActionButton(
          title: 'Add\nMember',
          iconData: Icons.add,
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => BlocProvider.value(
                  value: context.read<TeamMembersBloc>(),
                  child: AddAlertWidget()),
            );
          },
        ),
        _ActionButton(
          title: 'Remove all\nMembers',
          iconData: Icons.remove,
          onPressed: () {
            context.read<TeamMembersBloc>()..add(TeamMembersEventRemoveAll());
          },
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;

  _ActionButton({
    @required this.title,
    @required this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSecondary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            iconData,
            color: color,
          ),
          onPressed: onPressed,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

class AddAlertWidget extends StatefulWidget {
  @override
  _AddAlertWidgetState createState() => _AddAlertWidgetState();
}

class _AddAlertWidgetState extends State<AddAlertWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add new team member"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            autocorrect: false,
            controller: _textController,
            autofocus: true,
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          children: [
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Add"),
              onPressed: () {
                BlocProvider.of<TeamMembersBloc>(context).add(
                  TeamMembersEventAddMember(name: _textController.text),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
