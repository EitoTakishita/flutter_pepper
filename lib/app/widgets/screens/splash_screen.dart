import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/util/styles.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '居酒屋ぺっぱ〜',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Honya',
          ),
        ),
        backgroundColor: Styles.baseColor,
      ),
      // backgroundColor: Styles.baseColor,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/papa.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttonWidget(
              context: context,
              title: '検索',
              route: '/card',
              iconData: Icons.saved_search),
          buttonWidget(
              context: context,
              title: 'ルーレット',
              route: '/roulette',
              iconData: Icons.videogame_asset_outlined),
        ]),
      ),
    );
  }

  Widget buttonWidget(
      {BuildContext context, String title, String route, IconData iconData}) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: 300.0,
          height: 75.0,
          child: RaisedButton.icon(
            elevation: 12,
            icon: Icon(
              iconData,
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.deepOrange.withOpacity(0.6), width: 4),
              borderRadius: BorderRadius.circular(20),
            ),
            label: Text(
              title,
              style: TextStyle(
                fontFamily: 'Honya',
                fontSize: 24,
                letterSpacing: 0.75,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Styles.baseColor,
            splashColor: Colors.deepOrange.withOpacity(0.6),
            onPressed: () {
              Navigator.of(context).pushNamed(route);
            },
          ),
        ),
      ),
    );
  }
}
