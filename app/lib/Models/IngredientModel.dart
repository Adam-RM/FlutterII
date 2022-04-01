import 'package:flutter/material.dart';
import 'package:app/Constants/RecipeKey.dart';

class IngredientModel {
  final String amount;
  final String name;
  final String unit;

  IngredientModel(this.amount, this.name, this.unit);
  IngredientModel.fromJson(dynamic json)
      : amount = json[ingredient_amount_key],
        name = json[ingredient_name_key],
        unit = json[ingredient_unit_key];
}
