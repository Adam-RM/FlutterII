import 'package:flutter/material.dart';
import 'package:app/Constants/RecipeKey.dart';
import 'IngredientModel.dart';
import 'dart:convert';

class RecipeModel {
  final String? id;
  final String name;
  final String desc;
  final List<String>? tags;
  final String imageUrl;
  List<IngredientModel>? ingredients;
  List<String>? steps;
  final String? note;
  final String? forkef;

  RecipeModel(
      {this.id,
      required this.name,
      required this.desc,
      this.tags,
      required this.imageUrl,
      this.ingredients,
      this.steps,
      this.note,
      this.forkef});

  factory RecipeModel.fromJson(dynamic json) {
    var ingredientsJson = json[recipe_ingredients_key] as List;
    var stepsJson = json[recipe_steps_key] as List;
    return RecipeModel(
        id: json[recipe_id_key],
        name: json[recipe_name_key],
        desc: json[recipe_desc_key],
        tags: List.from([recipe_tags_key]),
        imageUrl: json[recipe_imageUrl_key],
        ingredients:
            ingredientsJson.map((i) => IngredientModel.fromJson(i)).toList(),
        steps: stepsJson.map((i) => getDescKey(i)).toList(),
        note: json[recipe_note_key],
        forkef: json[recipe_forkef_key]);
  }
}

String getDescKey(dynamic json) {
  return (json[step_desc_key]);
}
