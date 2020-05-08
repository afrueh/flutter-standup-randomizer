import 'package:flutter/material.dart';

class AddMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details page')),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black38,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset(
                'assets/images/placeholder.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('WIP', style: Theme.of(context).textTheme.headline2),
                const SizedBox(height: 10),
                Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus auctor dapibus nisi nec venenatis. Nulla tempor lectus non turpis ultricies, at euismod dolor tempus. Nulla facilisi. Suspendisse potenti. Nam cursus feugiat felis, varius vestibulum tortor pellentesque et. Fusce placerat ligula ac augue aliquam pulvinar. Ut interdum, diam quis consectetur maximus, ante nisi semper justo, sit amet convallis est tortor nec turpis. Nullam commodo tincidunt commodo. Nunc auctor at magna in venenatis. Sed ac ante in diam hendrerit molestie ut non enim.

                  Aliquam mattis elit laoreet enim molestie, vitae efficitur ante venenatis. Duis efficitur risus ac fringilla bibendum. Pellentesque semper vulputate ligula, elementum dictum tellus venenatis sit amet. Aliquam suscipit finibus arcu in posuere. Curabitur scelerisque enim mi, eget congue nulla suscipit et. Nulla vulputate rutrum dolor, nec sagittis sapien venenatis varius. Aenean tincidunt erat lacus, non efficitur ipsum tempor vel. Duis ut pharetra justo. Ut interdum vestibulum massa vitae egestas. Nam sit amet erat nec purus sollicitudin rutrum. Vestibulum pretium sed magna sit amet volutpat. Vestibulum et arcu pretium, finibus magna a, semper magna.

                  In orci risus, commodo vitae posuere nec, dapibus eu est. Donec laoreet urna varius, varius lorem eget, molestie sapien. Nam pulvinar massa a dui consequat, in aliquet massa molestie. Duis varius mattis sapien, sed consequat justo varius sit amet. Aliquam nec pellentesque ipsum. Suspendisse potenti. Aenean tortor tortor, ullamcorper at neque consectetur, commodo tempus nunc. Etiam euismod imperdiet mauris, ut consectetur dolor sodales nec. Nunc pharetra libero vitae eros ultricies euismod. Nam varius, velit eget tristique tempus, ante dolor consequat ipsum, dictum placerat magna nisi ac turpis.

                  Vivamus tellus magna, lobortis eget lectus et, fringilla ultricies arcu. Donec lectus orci, imperdiet sit amet mollis non, accumsan eget orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin auctor egestas lacus eget venenatis. Sed nec ex urna. Suspendisse nec mi at massa rhoncus pharetra ut non lacus. Sed non velit tincidunt, feugiat sem non, porta purus. Quisque pellentesque leo sit amet ex tincidunt ultrices.

                  Proin rutrum massa quis arcu lacinia, eu volutpat felis finibus. Fusce blandit dictum nisl, quis tempus velit commodo iaculis. Sed blandit leo vel hendrerit ullamcorper. Aenean accumsan pretium consequat. Etiam finibus leo eleifend orci consequat, sit amet congue ligula posuere. Suspendisse quis enim ut nulla tristique rutrum non id sem. Aliquam posuere condimentum elit nec sagittis. Nam consectetur molestie dignissim. Pellentesque vulputate ornare orci. """,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
