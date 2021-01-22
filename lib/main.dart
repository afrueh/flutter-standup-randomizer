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
  TeamMembersBloc _teamMembersBloc;
  DailyBloc _dailyBloc;

  _MainPageState() {
    _teamMembersBloc = TeamMembersBloc();
    _dailyBloc = DailyBloc(teamMembersBloc: _teamMembersBloc);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) {
          return _dailyBloc;
        }),
        BlocProvider(
          create: ((BuildContext context) {
            return _teamMembersBloc
              ..add(
                TeamMembersEventLoadData(),
              );
          }),
        ),
      ],
      child: BlocBuilder<DailyBloc, DailyState>(
        builder: ((context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                if (state is DailyStateNotStarted)
                  _AppBarActionButton(
                    title: 'Start Daily',
                    iconData: Icons.play_arrow_outlined,
                    onPressed: () {
                      context.read<DailyBloc>()..add(DailyEventStart());
                    },
                  ),
                if (state is DailyStateStarted)
                  _AppBarActionButton(
                    title: 'Stop Daily',
                    iconData: Icons.stop_circle_outlined,
                    onPressed: () {
                      context.read<DailyBloc>()..add(DailyEventStop());
                    },
                  ),
              ],
            ),
            body: ScrumPage(),
            floatingActionButton: ScrumMenuButton(),
          );
        }),
      ),
    );
  }
}

class _AppBarActionButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;

  _AppBarActionButton({
    @required this.title,
    @required this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              iconData,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
