import 'package:flutter/material.dart';

class CocktailDivider extends StatelessWidget {
  final String title;
  CocktailDivider({@required this.title});

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.of(context).size;

    return Container(
      height: device.height / 26,
      child: Row(
        children: <Widget>[
          Container(
            width: device.width / 3.5,
            color: Colors.white,
            child: Text(
              title,
              style: TextStyle(
                fontSize: device.width / 21
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 4),
              child: Divider(
                thickness: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}