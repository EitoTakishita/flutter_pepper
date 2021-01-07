import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pepper/app/resorces/viewmodels/pepper_viewmodels.dart';
import 'package:flutter_pepper/app/util/styles.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';

class ShopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pepperViewModel =
        Provider.of<PepperViewModel>(context, listen: false);
    final shop = pepperViewModel.shopDetail;
    return Container(
      color: Styles.baseColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                '${shop.name}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Honya',
                  letterSpacing: 1.25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${shop.catchCopy}',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Honya',
                letterSpacing: 0.25,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Color(0xFFe8c08b).withOpacity(0.4),
                border: Border.all(color: Color(0xFFe8c08b), width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '★ ${shop.access}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontSize: 16,
                    fontFamily: 'Honya',
                    letterSpacing: 1.25,
                    height: 1.1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '営業時間',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Honya',
                letterSpacing: 0.25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              '${shop.time}',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Honya',
                letterSpacing: 0.25,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _launchMaps(shop.name, shop.lat, shop.lng);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'マップで見る',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontFamily: 'Honya',
                    letterSpacing: 1.25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchMaps(String name, double lat, double lon) async {
    MapsLauncher.launchQuery(name);
    MapsLauncher.launchCoordinates(lat, lon);
  }
}
