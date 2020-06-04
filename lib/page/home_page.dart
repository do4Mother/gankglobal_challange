import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gankglobal_challange/bloc/cocktail/cocktail_bloc.dart';
import 'package:gankglobal_challange/page/search_page.dart';
import 'package:gankglobal_challange/widget/cocktail_card.dart';
import 'package:gankglobal_challange/widget/cocktail_skeleton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // get device width and height size for responsive design
    Size device = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              hintText: 'Search',
              contentPadding: EdgeInsets.only(
                top: 15.0,
                left: 10.0,
                right: 10.0
              )
            ),
            onFieldSubmitted: (text){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => SearchPage(searchText: text)
                )
              );
            },
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0, left: 16.0, right: 16.0, bottom: 0
                ),
                child: Text(
                  'Discover Recipes',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0
                ),
                child: Text(
                  'Trending',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 230,
                child: BlocBuilder<CocktailBloc, CocktailState>(
                  builder: (_, state) {
                    if(state is CocktailLoaded) {
                      return ListView.builder(
                        itemCount: state.drinks.length > 5 ? 5 : state.drinks.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i){
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CocktailCard(
                              drinks: state.drinks[i],
                            ),
                          );
                        },
                      );
                    }
                    
                    return ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i){
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CocktailSkeleton(),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0
                ),
                child: Text(
                  'Based on your Bar',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0
                ),
                child: BlocBuilder<CocktailBloc, CocktailState>(
                  builder: (_, state){
                    if(state is CocktailLoaded) {
                      return GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: device.width / 460,
                        children: List.generate(
                          state.drinks.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CocktailCard(drinks: state.drinks[index],),
                            );
                          }
                        ),
                      );
                    }

                    return GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: device.width / 460,
                      children: List.generate(
                        10,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: CocktailSkeleton(),
                          );
                        }
                      ),
                    );
                  }, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

