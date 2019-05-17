import 'package:flutter/material.dart';
import 'package:friendly_eats_flutter/rating_bar.dart';
import 'package:friendly_eats_flutter/restaurant_router.dart';

class Restaurant extends StatelessWidget {
  //Restaurant properties
  final String title;
  final String city;
  final String category;
  final double avgRating;
  final int numRatings;
  final int price;
  final String photo;

  const Restaurant({
    Key key,
    @required this.title,
    @required this.city,
    @required this.category,
    @required this.avgRating,
    @required this.numRatings,
    @required this.photo,
    @required this.price,
  })  : assert(title != null),
        assert(city != null),
        assert(category != null),
        assert(avgRating != null),
        //assert(numRatings != null),
        assert(photo != null),
        assert(price != null);

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 100.0,
        child: InkWell(
          child: Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text(title),
              subtitle: new Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new StarRating(rating: avgRating),
                        Text("(" + numRatings.toString() + ")"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          category,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(" - "),
                        Text(city)
                      ],
                    ),
                  ]
              ),

              trailing: (price == 1) ? Text('\$'): (price == 2) ? Text('\$\$'): Text('\$\$\$'),

              isThreeLine: true,
            ),
          ),
        ),
      ),
    );
  }
}
