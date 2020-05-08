import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String imageUrl;

  const Background({
    Key key,
    @required this.child,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
            imageUrl: imageUrl,
            errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsets.all(30.0),
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
                    style: Theme.of(context).textTheme.headline5.apply(
                          color: Theme.of(context).errorColor,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: child,
        )
      ],
    );
  }
}
