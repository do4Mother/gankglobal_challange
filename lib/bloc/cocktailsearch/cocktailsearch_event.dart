part of 'cocktailsearch_bloc.dart';

abstract class CocktailsearchEvent extends Equatable {
  const CocktailsearchEvent();

  @override
  List<Object> get props => [];
}


class CocktailSearch extends CocktailsearchEvent {
  final String searchText;

  CocktailSearch({@required this.searchText});

  @override
  List<Object> get props => [searchText];

  @override
  String toString() => 'CocktailSearch $searchText';
}