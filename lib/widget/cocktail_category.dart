import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gankglobal_challange/model/cocktail_model.dart';

class CocktailCategory extends StatelessWidget {
  final Drinks cocktailDrinks;

  const CocktailCategory({
    Key key,
    @required this.cocktailDrinks
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get device width and height size for responsive design
    Size device = MediaQuery.of(context).size;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: device.width / 3.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.cocktail,
                color: Colors.grey[400],
                size: device.width / 9,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                cocktailDrinks.strCategory,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        Container(
          width: device.width / 3.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.glassWhiskey,
                color: Colors.grey[400],
                size: device.width / 9,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                cocktailDrinks.strGlass,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        Container(
          width: device.width / 3.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.wineBottle,
                color: Colors.grey[400],
                size: device.width / 9,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                cocktailDrinks.strAlcoholic,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }
}