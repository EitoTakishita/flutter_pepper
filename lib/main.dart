import 'package:animated_card/animated_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/repository/article_repository.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'app/resorces/viewmodels/viewmodels.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Card Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StateNotifierProvider<ShopController, ShopsState>(
        create: (context) => ShopController(ArticleRepository()),
        child: ListagemScreen(),
      ),
    );
  }
}

class ListagemScreen extends StatelessWidget {
  final lista = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Animation Example")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return AnimatedCard(
            direction: AnimatedCardDirection.left,
            //Initial animation direction
            initDelay: Duration(milliseconds: 0),
            //Delay to initial animation
            duration: Duration(seconds: 1),
            //Initial animation duration
//            onRemove: () => lista.removeAt(index), //Implement this action to active dismiss
            curve: Curves.bounceOut,
            //Animation curve
            child: GestureDetector(
//                onTap: () {
//////                  Navigator.push(context,
//////                      MaterialPageRoute(builder: (context) => ArticleScreen()));
//////                },
              onTap: () => context.read<ShopController>().increment(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    title: Container(
                      height: 150,
                      child: Center(child: Text("$index")),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
