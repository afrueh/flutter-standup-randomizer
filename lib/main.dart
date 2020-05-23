import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standup_randomizer/pages/pages.dart';

import 'blocs/blocs.dart';
import 'widgets/widgets.dart';

void main() => runApp(MyApp());

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
    return BlocProvider(
      create: ((BuildContext context) {
        return TeamMembersBloc()
          ..add(
            TeamMembersEventLoadData(),
          );
      }),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ScrumPage(),
        floatingActionButton: ScrumMenuButton(),
      ),
    );
  }
}
