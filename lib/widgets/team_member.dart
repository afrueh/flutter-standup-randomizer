import 'package:flutter/material.dart';

class TeamMember extends StatefulWidget {
  final double width;
  final double height;
  final String name;

  const TeamMember({Key key, this.width = 200, this.height = 200, this.name})
      : super(key: key);

  @override
  _TeamMemberState createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> {
  bool inOffice = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
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
          width: widget.width,
          height: widget.height,
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
                    Image.asset(
                      'assets/images/placeholder.png',
                      width: widget.width * 0.8,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              if (!inOffice)
                Container(
                  width: widget.width,
                  height: widget.height,
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
