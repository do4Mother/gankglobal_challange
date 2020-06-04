part of 'cocktail_bloc.dart';

abstract class CocktailState extends Equatable {
  const CocktailState();
  @override
  List<Object> get props => [];
}

// initialization state
class CocktailInitial extends CocktailState {}

// create state for cocktail loading
class CocktailLoading extends CocktailState {}

// create state for cocktail loaded
class CocktailLoaded extends CocktailState {
  
  // initialization list of drinks for return to page screen
  final List<Drinks> drinks;

  CocktailLoaded({@required this.drinks});

  @override
  List<Object> get props => [drinks];

  @override
  String toString() => 'Cocktail Laoded { drinks: $drinks }';
}

// create state for error get data
class CocktailError extends CocktailState {}