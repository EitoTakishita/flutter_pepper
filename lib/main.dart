import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/roulette_viewmodels.dart';
import 'package:flutter_pepper/app/widgets/screens/card_list_screen.dart';
import 'package:flutter_pepper/app/widgets/screens/roulette_screen.dart';
import 'package:flutter_pepper/app/widgets/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'app/resorces/viewmodels/location_viewmodels.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PepperViewModel()),
        ChangeNotifierProvider(create: (context) => LocationViewModel()),
        ChangeNotifierProvider(create: (context) => RouletteViewModel()),
      ],
      child: MaterialApp(
        title: '居酒屋ぺっぱー',
        theme: ThemeData(
          primaryColor: Color(0xFF475499),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/card': (context) => CardListScreen(),
          '/roulette': (context) => RouletteScreen(),
        },
      ),
    );
  }
}
