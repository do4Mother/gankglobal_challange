import 'package:equatable/equatable.dart';

class Drinks extends Equatable {
  final String idDrink;
  final String strDrink;
  final String strDrinkAlternate;
  final String strDrinkES;
  final String strDrinkDE;
  final String strDrinkFR;
  final String strDrinkZHHANS;
  final String strDrinkZHHANT;
  final String strTags;
  final String strVideo;
  final String strCategory;
  final String strIBA;
  final String strAlcoholic;
  final String strGlass;
  final String strInstructions;
  final String strInstructionsES;
  final String strInstructionsDE;
  final String strInstructionsFR;
  final String strInstructionsZHHANS;
  final String strInstructionsZHHANT;
  final String strDrinkThumb;
  final String strIngredient1;
  final String strIngredient2;
  final String strIngredient3;
  final String strIngredient4;
  final String strIngredient5;
  final String strIngredient6;
  final String strIngredient7;
  final String strIngredient8;
  final String strIngredient9;
  final String strIngredient10;
  final String strIngredient11;
  final String strIngredient12;
  final String strIngredient13;
  final String strIngredient14;
  final String strIngredient15;
  final String strMeasure1;
  final String strMeasure2;
  final String strMeasure3;
  final String strMeasure4;
  final String strMeasure5;
  final String strMeasure6;
  final String strMeasure7;
  final String strMeasure8;
  final String strMeasure9;
  final String strMeasure10;
  final String strMeasure11;
  final String strMeasure12;
  final String strMeasure13;
  final String strMeasure14;
  final String strMeasure15;
  final String strCreativeCommonsConfirmed;
  final String dateModified;

  Drinks(
      {this.idDrink,
      this.strDrink,
      this.strDrinkAlternate,
      this.strDrinkES,
      this.strDrinkDE,
      this.strDrinkFR,
      this.strDrinkZHHANS,
      this.strDrinkZHHANT,
      this.strTags,
      this.strVideo,
      this.strCategory,
      this.strIBA,
      this.strAlcoholic,
      this.strGlass,
      this.strInstructions,
      this.strInstructionsES,
      this.strInstructionsDE,
      this.strInstructionsFR,
      this.strInstructionsZHHANS,
      this.strInstructionsZHHANT,
      this.strDrinkThumb,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strIngredient6,
      this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5,
      this.strMeasure6,
      this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      this.strCreativeCommonsConfirmed,
      this.dateModified});

  // convert json to object
  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(
      idDrink : json['idDrink'] as String,
      strDrink : json['strDrink'] as String,
      strDrinkAlternate : json['strDrinkAlternate'] as String,
      strDrinkES : json['strDrinkES'] as String,
      strDrinkDE : json['strDrinkDE'] as String,
      strDrinkFR : json['strDrinkFR'] as String,
      strDrinkZHHANS : json['strDrinkZH-HANS'] as String,
      strDrinkZHHANT : json['strDrinkZH-HANT'] as String,
      strTags : json['strTags'] as String,
      strVideo : json['strVideo'] as String,
      strCategory : json['strCategory'] as String,
      strIBA : json['strIBA'] as String,
      strAlcoholic : json['strAlcoholic'] as String,
      strGlass : json['strGlass'] as String,
      strInstructions : json['strInstructions'] as String,
      strInstructionsES : json['strInstructionsES'] as String,
      strInstructionsDE : json['strInstructionsDE'] as String,
      strInstructionsFR : json['strInstructionsFR'] as String,
      strInstructionsZHHANS : json['strInstructionsZH-HANS'] as String,
      strInstructionsZHHANT : json['strInstructionsZH-HANT'] as String,
      strDrinkThumb : json['strDrinkThumb'] as String,
      strIngredient1 : json['strIngredient1'] as String,
      strIngredient2 : json['strIngredient2'] as String,
      strIngredient3 : json['strIngredient3'] as String,
      strIngredient4 : json['strIngredient4'] as String,
      strIngredient5 : json['strIngredient5'] as String,
      strIngredient6 : json['strIngredient6'] as String,
      strIngredient7 : json['strIngredient7'] as String,
      strIngredient8 : json['strIngredient8'] as String,
      strIngredient9 : json['strIngredient9'] as String,
      strIngredient10 : json['strIngredient10'] as String,
      strIngredient11 : json['strIngredient11'] as String,
      strIngredient12 : json['strIngredient12'] as String,
      strIngredient13 : json['strIngredient13'] as String,
      strIngredient14 : json['strIngredient14'] as String,
      strIngredient15 : json['strIngredient15'] as String,
      strMeasure1 : json['strMeasure1'] as String,
      strMeasure2 : json['strMeasure2'] as String,
      strMeasure3 : json['strMeasure3'] as String,
      strMeasure4 : json['strMeasure4'] as String,
      strMeasure5 : json['strMeasure5'] as String,
      strMeasure6 : json['strMeasure6'] as String,
      strMeasure7 : json['strMeasure7'] as String,
      strMeasure8 : json['strMeasure8'] as String,
      strMeasure9 : json['strMeasure9'] as String,
      strMeasure10 : json['strMeasure10'] as String,
      strMeasure11 : json['strMeasure11'] as String,
      strMeasure12 : json['strMeasure12'] as String,
      strMeasure13 : json['strMeasure13'] as String,
      strMeasure14 : json['strMeasure14'] as String,
      strMeasure15 : json['strMeasure15'] as String,
      strCreativeCommonsConfirmed : json['strCreativeCommonsConfirmed'] as String,
      dateModified : json['dateModified'] as String,
    );
  }

  // convert to Map for iterate key, values
  Map<String, dynamic> toMap() {
    return {
      'idDrink': idDrink,
      'strDrink': strDrink,
      'strDrinkAlternate': strDrinkAlternate,
      'strDrinkES': strDrinkES,
      'strDrinkDE': strDrinkDE,
      'strDrinkFR': strDrinkFR,
      'strDrinkZHHANS': strDrinkZHHANS,
      'strDrinkZHHANT': strDrinkZHHANT,
      'strTags': strTags,
      'strVideo': strVideo,
      'strCategory': strCategory,
      'strIBA': strIBA,
      'strAlcoholic': strAlcoholic,
      'strGlass': strGlass,
      'strInstructions': strInstructions,
      'strInstructionsES': strInstructionsES,
      'strInstructionsDE': strInstructionsDE,
      'strInstructionsFR': strInstructionsFR,
      'strInstructionsZHHANS': strInstructionsZHHANS,
      'strInstructionsZHHANT': strInstructionsZHHANT,
      'strDrinkThumb': strDrinkThumb,
      'strIngredient1': strIngredient1,
      'strIngredient2': strIngredient2,
      'strIngredient3': strIngredient3,
      'strIngredient4': strIngredient4,
      'strIngredient5': strIngredient5,
      'strIngredient6': strIngredient6,
      'strIngredient7': strIngredient7,
      'strIngredient8': strIngredient8,
      'strIngredient9': strIngredient9,
      'strIngredient10': strIngredient10,
      'strIngredient11': strIngredient11,
      'strIngredient12': strIngredient12,
      'strIngredient13': strIngredient13,
      'strIngredient14': strIngredient14,
      'strIngredient15': strIngredient15,
      'strMeasure1': strMeasure1,
      'strMeasure2': strMeasure2,
      'strMeasure3': strMeasure3,
      'strMeasure4': strMeasure4,
      'strMeasure5': strMeasure5,
      'strMeasure6': strMeasure6,
      'strMeasure7': strMeasure7,
      'strMeasure8': strMeasure8,
      'strMeasure9': strMeasure9,
      'strMeasure10': strMeasure10,
      'strMeasure11': strMeasure11,
      'strMeasure12': strMeasure12,
      'strMeasure13': strMeasure13,
      'strMeasure14': strMeasure14,
      'strMeasure15': strMeasure15,
      'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
      'dateModified': dateModified
    };
  }

  @override
  List<Object> get props => [
    idDrink,
    strDrink,
    strDrinkAlternate,
    strDrinkES,
    strDrinkDE,
    strDrinkFR,
    strDrinkZHHANS,
    strDrinkZHHANT,
    strTags,
    strVideo,
    strCategory,
    strIBA,
    strAlcoholic,
    strGlass,
    strInstructions,
    strInstructionsES,
    strInstructionsDE,
    strInstructionsFR,
    strInstructionsZHHANS,
    strInstructionsZHHANT,
    strDrinkThumb,
    strIngredient1,
    strIngredient2,
    strIngredient3,
    strIngredient4,
    strIngredient5,
    strIngredient6,
    strIngredient7,
    strIngredient8,
    strIngredient9,
    strIngredient10,
    strIngredient11,
    strIngredient12,
    strIngredient13,
    strIngredient14,
    strIngredient15,
    strMeasure1,
    strMeasure2,
    strMeasure3,
    strMeasure4,
    strMeasure5,
    strMeasure6,
    strMeasure7,
    strMeasure8,
    strMeasure9,
    strMeasure10,
    strMeasure11,
    strMeasure12,
    strMeasure13,
    strMeasure14,
    strMeasure15,
    strCreativeCommonsConfirmed,
    dateModified
  ];

  @override
  String toString() => 'Drinks Model { $strDrink }';
}

