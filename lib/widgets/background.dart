import 'package:flutter/material.dart';
import 'package:standup_randomizer/services/flickr_service.dart';

class Background extends StatefulWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  Future<FlickrPhotoOfTheDay> futurePhoto;

  @override
  void initState() {
    super.initState();

    final flickrService = FlickrService();
    futurePhoto = flickrService.getImageOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: FutureBuilder<FlickrPhotoOfTheDay>(
        future: futurePhoto,
        builder: (context, snapshot) {
          Stack stack;
          if (snapshot.hasData) {
            stack = _successStack(snapshot.data);
          } else if (snapshot.hasError) {
            stack = _errorStack();
          } else {
            stack = _loadingStack();
          }
          return stack;
        },
      ),
    );
  }

  Stack _successStack(FlickrPhotoOfTheDay photoOfTheDay) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          photoOfTheDay.photoUrl,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            constraints: BoxConstraints.loose(Size(300, 70)),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            color: Colors.black.withAlpha(150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  photoOfTheDay.title,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline6, //.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  photoOfTheDay.owner,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle2, //.subtitle2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        widget.child,
      ],
    );
  }

  Stack _errorStack() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Spacer(),
              Icon(
                Icons.error,
                size: 50,
                color: Theme.of(context).errorColor,
              ),
              Text(
                'Failed to load background image',
                style: Theme.of(context).textTheme.headline6.apply(
                      //.headline5.apply(
                      color: Theme.of(context).errorColor,
                    ),
              ),
            ],
          ),
        ),
        widget.child,
      ],
    );
  }

  Stack _loadingStack() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ],
        ),
        widget.child,
      ],
    );
  }
}
