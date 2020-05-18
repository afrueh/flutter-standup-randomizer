import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:standup_randomizer/pages/pages.dart';
import 'package:standup_randomizer/widgets/widgets.dart';

void main() => runApp(MyApp());

const double _fabDimension = 60.0;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrum Randomizer',
      theme: ThemeData.light(),
      home: MainPage(title: 'Scrum Randomizer'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Background(
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
      ),
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext context, VoidCallback _) {
          return AddMember();
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_fabDimension / 2),
          ),
        ),
        transitionDuration: Duration(seconds: 1),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ),
    );
  }
}
