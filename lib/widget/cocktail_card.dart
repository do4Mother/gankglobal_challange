import 'package:flutter/material.dart';
import 'package:gankglobal_challange/model/cocktail_model.dart';
import 'package:gankglobal_challange/page/detail_page.dart';

class CocktailCard extends StatelessWidget {
  final Drinks drinks;

  const CocktailCard({
    Key key,
    @required this.drinks
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                  drinks.strDrinkThumb
                )
              )
            ),
            width: 135,
            height: 135,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            drinks.strDrink,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            drinks.strCategory,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              cocktailDrink: drinks,
            )
          )
        );
      },
    );
  }
}