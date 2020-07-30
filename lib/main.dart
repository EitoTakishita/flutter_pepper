import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/viewmodels.dart';
import 'package:flutter_pepper/app/widgets/screens/card_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PepperViewModel()),
      ],
      child: MaterialApp(
        title: '居酒屋ぺっぱー',
        theme: ThemeData(
          primaryColor: Color(0xFF475499),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => CardListScreen(),
        },
      ),
    );
  }
}


