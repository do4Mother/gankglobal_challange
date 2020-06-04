import 'dart:convert';

import 'package:gankglobal_challange/model/cocktail_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseCocktailSearchRepositories {
  Future<List<Drinks>> searchDrinks(String searchText);
}

class CocktailSearchRepositories extends BaseCocktailSearchRepositories {
  final String _baseUrl =
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=';
  final http.Client _client;

  // declare List<Drinks> can be used for pagination api,
  // unfortunately cocktail db doesnt provide api with pagination
  List<Drinks> searchDrinksData;

  CocktailSearchRepositories({http.Client httpClient})
      : _client = httpClient ?? http.Client();

  // get drinks or cocktail with keywords
  @override
  Future<List<Drinks>> searchDrinks(String searchText) async {
    try {
      var result = await _client.get('$_baseUrl$searchText');
      if (result.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(result.body);
        List<dynamic> getData = data['drinks'];
        searchDrinksData = getData.map((e) => Drinks.fromJson(e)).toList();
      }
      return searchDrinksData;
    } catch (e) {
      throw e;
    }
  }
}
