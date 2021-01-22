import 'package:flutter/material.dart';

class TeamMemberWidget extends StatefulWidget {
  final String name;

  const TeamMemberWidget({Key key, this.name}) : super(key: key);

  @override
  _TeamMemberWidgetState createState() => _TeamMemberWidgetState();
}

class _TeamMemberWidgetState extends State<TeamMemberWidget> {
  bool inOffice = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      color: inOffice
          ? Theme.of(context).cardTheme.color
          : Theme.of(context).disabledColor,
      child: InkWell(
        onTap: () {
          setState(() {
            inOffice = !inOffice;
          });
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.name ?? 'John Doe',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/placeholder.png'),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!inOffice)
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Not Available",
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
