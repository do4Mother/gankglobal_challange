import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gankglobal_challange/model/cocktail_model.dart';
import 'package:gankglobal_challange/widget/cocktail_category.dart';
import 'package:gankglobal_challange/widget/cocktail_divider.dart';

class DetailPage extends StatefulWidget {
  final Drinks cocktailDrink;
  DetailPage({Key key, @required this.cocktailDrink});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isLove = true;

  @override
  Widget build(BuildContext context) {
    // get device width and height size for responsive design
    Size device = MediaQuery.of(context).size;

    // convert to map for get key and values
    Map<String, dynamic> _ingredients = widget.cocktailDrink.toMap();
    
    List<Widget> _ingredientsWidget = List<Widget>();

    // add ingredientsItem widget
    for(int i = 0; i < 14; i++){
      if(_ingredients['strIngredient${i + 1}'] != null && _ingredients['strMeasure${i + 1}'] != null){
        _ingredientsWidget.add(
          ingredientsItem(
            context, 
            _ingredients['strMeasure${i + 1}'],
            _ingredients['strIngredient${i + 1}']
          )
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxisScrolled){
          return <Widget> [
            SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              elevation: 0.0,
              floating: false,
              excludeHeaderSemantics: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.cocktailDrink.strDrinkThumb
                      )
                    )
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: 1,
                      sigmaX: 1
                    ),
                    child: Container(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
            ),
          ];
        }, 
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 12.0, horizontal: 16.0
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${widget.cocktailDrink.strDrink}',
                          style: Theme.of(context).textTheme.headline1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isLove ? CupertinoIcons.heart : CupertinoIcons.heart_solid,
                          color: Colors.red[700],
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLove = !_isLove;
                          });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CocktailCategory(
                  cocktailDrinks: widget.cocktailDrink,
                ),
                SizedBox(
                  height: 25,
                ),
                CocktailDivider(title: 'Ingredients'),
                SizedBox(
                  height: 10,
                ),
                for(Widget item in _ingredientsWidget) item,
                SizedBox(
                  height: 15,
                ),
                CocktailDivider(title: 'Instructions'),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.cocktailDrink.strInstructions,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: device.width / 22
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  Padding ingredientsItem(BuildContext context, String measure, String ingredients) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8),
            width: MediaQuery.of(context).size.width / 2.5,
            child: Text(
              measure,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
          ),
          Container(
            child: Text(
              ingredients,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
