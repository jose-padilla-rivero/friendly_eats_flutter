import 'package:flutter/material.dart';
import 'package:friendly_eats_flutter/restaurant_router.dart';


void main() => runApp(FriendlyEatsApp());

class FriendlyEatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: RestaurantRouter(),
    );
  }
}
