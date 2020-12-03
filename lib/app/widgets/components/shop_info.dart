import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:provider/provider.dart';

class ShopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pepperViewModel =
        Provider.of<PepperViewModel>(context, listen: false);
    final shop = pepperViewModel.shopDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.only(
              bottom: 5, // space between underline and text
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.deepOrange, // Text colour here
              width: 3, // Underline width
            ))),
            child: Text(
              '${shop.name}',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Noto Sans CJK JP',
                letterSpacing: 1.25,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Color(0xFFe8c08b).withOpacity(0.2),
              border: Border.all(
                  color: Color(0xFFe8c08b).withOpacity(0.7), width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              shop.access,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.75),
                  fontSize: 16,
                  fontFamily: 'Noto Sans CJK JP',
                  letterSpacing: 1.25,
                  height: 1.1),
            ),
          ),
        )
      ],
    );
  }
}
