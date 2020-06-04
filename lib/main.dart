import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gankglobal_challange/bloc/cocktail/cocktail_bloc.dart';
import 'package:gankglobal_challange/bloc/cocktailsearch/cocktailsearch_bloc.dart';
import 'package:gankglobal_challange/page/home_page.dart';
import 'package:gankglobal_challange/repositories/cocktail_repositories.dart';
import 'package:gankglobal_challange/repositories/searchcocktail_repositories.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CocktailBloc(
            cocktailRepositories: CocktailRepositories()
          )..add(CocktailLoad()),
        ),
        BlocProvider(
          create: (_) => CocktailsearchBloc(
            cocktailSearchRepositories: CocktailSearchRepositories()
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child){
          // add theme to builder for get mediaquery context.
          return Theme(
            data: ThemeData(
              primaryColor: Colors.white,
              primarySwatch: Colors.blue,
              fontFamily: 'SF',
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: TextTheme(
                headline1: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                headline2: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width / 17,
                  fontWeight: FontWeight.w600
                ),
                subtitle1: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 28,
                  color: Colors.grey[700]
                ),
                bodyText1: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 25,
                  fontWeight: FontWeight.w600
                ),
                bodyText2: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 25,
                )
              )
            ),
            child: child
          );
        },
        title: 'Cocktail',
        home: HomePage(),
      ),
    );
  }
}