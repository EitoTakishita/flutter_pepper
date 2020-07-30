import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

class CardListScreen extends StatelessWidget {
  final list = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("店舗一覧")),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return AnimatedCard(
            direction: AnimatedCardDirection.left,
            //Initial animation direction
            initDelay: Duration(milliseconds: 0),
            //Delay to initial animation
            duration: Duration(seconds: 1),
            curve: Curves.bounceOut,
            //Animation curve
            child: GestureDetector(
//              onTap: () => context.read<ShopController>().increment(),
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
