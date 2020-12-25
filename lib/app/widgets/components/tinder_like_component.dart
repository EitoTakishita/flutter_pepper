import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/util/styles.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:tcard/tcard.dart';

class TinderLikeComponent extends StatelessWidget {
  final _controller = TCardController();

  @override
  Widget build(BuildContext context) {
    final pepperViewModel = Provider.of<PepperViewModel>(context);
    final shops = pepperViewModel.shops;

    final cards = List.generate(
      shops.shop != null ? shops.shop.length : 0,
      (int index) {
        return Container(
          decoration: BoxDecoration(
            color: Styles.baseColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23.0,
                spreadRadius: -13.0,
                color: Colors.black54,
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    shops.shop[index].photo.pc.l,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 5, // space between underline and text
                  ),
                  decoration: BoxDecoration(
                      color: Styles.baseColor,
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.deepOrange, // Text colour here
                        width: 3, // Underline width
                      ))),
                  child: Text(
                    '${shops.shop[index].name}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Honya',
                      letterSpacing: 1.25,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  child: Text(
                    '${shops.shop[index].catchCopy}',
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Honya',
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin:
                      EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFe8c08b).withOpacity(0.4),
                    border: Border.all(color: Color(0xFFe8c08b), width: 2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '★ ${shops.shop[index].access}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.75),
                        fontSize: 13,
                        fontFamily: 'Honya',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.25,
                        height: 1.1),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    return Center(
      child: TCard(
        cards: cards,
        size: Size(380, 580),
        controller: _controller,
        onForward: (index, info) {
          print(index);
          print(info.direction);
          if (info.direction == SwipDirection.Right) {
            _launchMaps(
                name: shops.shop[index].name,
                lat: shops.shop[index].lat,
                lon: shops.shop[index].lng);
          } else {
            print('nope');
          }
        },
        onBack: (index) {
          print('nope');
        },
        onEnd: () {
          print('end');
        },
      ),
    );
  }

  void _launchMaps({String name, double lat, double lon}) async {
    MapsLauncher.launchQuery(name);
    MapsLauncher.launchCoordinates(lat, lon);
  }
}
