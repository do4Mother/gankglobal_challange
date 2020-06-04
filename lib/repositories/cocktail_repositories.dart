import 'dart:convert';
import 'dart:math';

import 'package:gankglobal_challange/model/cocktail_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseCocktailRepositories {
  Future<List<Drinks>> getDrinks();
  String randomString(int length);
}

class CocktailRepositories extends BaseCocktailRepositories {
  final String _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=';
  final http.Client _client;

  // declare List<Drinks> can be used for pagination api,
  // unfortunately cocktail db doesnt provide api with pagination
  List<Drinks> drinksData;

  // passing http client if not add http client
  CocktailRepositories({http.Client httpClient})
      : _client = httpClient ?? http.Client();

  // get list cocktail
  @override
  Future<List<Drinks>> getDrinks() async {
    try {
      var result = await _client.get('$_baseUrl${randomString(1)}');
      if(result.statusCode == 200){
        Map<String, dynamic> data = jsonDecode(result.body);
        List<dynamic> getData = data['drinks'];
        drinksData = getData.map((e) => Drinks.fromJson(e)).toList();
      }
      return drinksData;
    } catch (e) {
      throw e;
    } 
  }

  // random string for random cocktail ex. A, B, C, etc.
  @override
  String randomString(int length) {
   var rand = new Random();
   var codeUnits = new List.generate(
      length, 
      (index){
         return rand.nextInt(33)+89;
      }
   );
   
   return new String.fromCharCodes(codeUnits);
  }
}
