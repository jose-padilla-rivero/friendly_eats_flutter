import 'package:flutter/material.dart';
import 'package:friendly_eats_flutter/restaurant_router.dart';
import 'package:friendly_eats_flutter/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _backgroundColor = Colors.green[100];

class RestaurantRouter extends StatelessWidget{
  const RestaurantRouter();

  @override
  Widget build(BuildContext context) {
    final restaurants = <Restaurant>[];

    final query = StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('restaurants').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new Restaurant(
                  title: document['name'].toString(),
                );
              }).toList(),
            );
        }
      },
    );

    final listView = Container(
      child: query,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'FriendlyEats',
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}