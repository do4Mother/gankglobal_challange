part of 'cocktailsearch_bloc.dart';

abstract class CocktailsearchState extends Equatable {
  const CocktailsearchState();

  @override
  List<Object> get props => [];
}

class CocktailsearchInitial extends CocktailsearchState {}

class CocktailsearchLoading extends CocktailsearchState {}

class CocktailsearchLoaded extends CocktailsearchState {
  final List<Drinks> drinks;

  CocktailsearchLoaded({@required this.drinks});

  @override
  List<Object> get props => [drinks];

  @override
  String toString() => 'CocktailsearchLoaded drinks { $drinks }';
}

class CocktailsearchError extends CocktailsearchState {}