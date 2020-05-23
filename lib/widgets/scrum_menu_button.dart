import 'dart:math';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

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
        IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            onPressed: () {
              print('Add');
            }),
        IconButton(
            icon: Icon(
              Icons.remove,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            onPressed: () {
              print('Remove');
            })
      ],
    );
  }
}
