import 'package:flutter/material.dart';
import 'package:friendly_eats_flutter/restaurant_router.dart';

class Restaurant extends StatelessWidget {

  //Restaurant properties
  final String title;

  const Restaurant({
    Key key,
    @required this.title,
}): assert(title != null);


  Widget build(BuildContext context){
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 100.0,
        child: InkWell(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}