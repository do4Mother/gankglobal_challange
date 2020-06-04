import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gankglobal_challange/repositories/cocktail_repositories.dart';
import 'package:meta/meta.dart';
import 'package:gankglobal_challange/model/cocktail_model.dart';

part 'cocktail_event.dart';
part 'cocktail_state.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  final CocktailRepositories _cocktailRepositories;

  CocktailBloc({CocktailRepositories cocktailRepositories})
      : assert(cocktailRepositories != null),
        _cocktailRepositories = cocktailRepositories;

  @override
  CocktailState get initialState => CocktailInitial();

  @override
  Stream<CocktailState> mapEventToState(
    CocktailEvent event,
  ) async* {
    if (event is CocktailLoad) {
      yield* _mapCocktailLoadToState();
    }
  }

  Stream<CocktailState> _mapCocktailLoadToState() async* {
    yield CocktailLoading();
    try {
      List<Drinks> _drinks = await _cocktailRepositories.getDrinks();
      yield CocktailLoaded(drinks: _drinks);
    } catch (e) {
      yield CocktailError();
    }
  }

}
