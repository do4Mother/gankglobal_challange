import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gankglobal_challange/model/cocktail_model.dart';
import 'package:gankglobal_challange/repositories/searchcocktail_repositories.dart';
import 'package:meta/meta.dart';

part 'cocktailsearch_event.dart';
part 'cocktailsearch_state.dart';

class CocktailsearchBloc extends Bloc<CocktailsearchEvent, CocktailsearchState> {
  CocktailSearchRepositories _cocktailSearchRepositories;

  CocktailsearchBloc({ CocktailSearchRepositories cocktailSearchRepositories }) : assert(cocktailSearchRepositories != null), _cocktailSearchRepositories = cocktailSearchRepositories;

  @override
  CocktailsearchState get initialState => CocktailsearchInitial();

  @override
  Stream<CocktailsearchState> mapEventToState(
    CocktailsearchEvent event,
  ) async* {
    if(event is CocktailSearch) {
      yield CocktailsearchLoading();
      try {
        List<Drinks> _searchDrinks = await _cocktailSearchRepositories.searchDrinks(event.searchText);
        yield CocktailsearchLoaded(drinks: _searchDrinks);
      } catch (e) {
        yield CocktailsearchError();
      }
    }
  }
}
