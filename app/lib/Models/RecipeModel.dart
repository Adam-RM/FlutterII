import 'package:flutter/material.dart';
import 'package:app/Constants/RecipeKey.dart';
import 'IngredientModel.dart';
import 'dart:convert';

class RecipeModel {
  final String id;
  final String name;
  final String desc;
  final List<String> tags;
  final String imageUrl;
  List<IngredientModel> ingredients;
  List<String> steps;
  final String note;
  final String forkef;

  RecipeModel(
      {required this.id,
      required this.name,
      required this.desc,
      required this.tags,
      required this.imageUrl,
      required this.ingredients,
      required this.steps,
      required this.note,
      required this.forkef});
  factory RecipeModel.fromJson(dynamic json) {
    var ingredientsJson = json[recipe_ingredients_key] as List;
    var stepsJson = json[recipe_steps_key] as List;
    print("1" + json[recipe_id_key]);
    print("2" + json[recipe_name_key]);
    print("3" + json[recipe_desc_key]);
    print("4");
    print(json[recipe_tags_key]);
    print("5" + json[recipe_imageUrl_key]);
    print("6");
    print(ingredientsJson.map((i) => IngredientModel.fromJson(i)).toList());
    print("7");
    print(stepsJson.map((i) => getDescKey(i)).toList());
    print("8" + json[recipe_note_key]);
    print("9" + json[recipe_forkef_key]);

    List<IngredientModel> ingredients =
        ingredientsJson.map((i) => IngredientModel.fromJson(i)).toList();
    print("10");
    List<String> steps = stepsJson.map((i) => getDescKey(i)).toList();
    print("11");
    List<String> patate = List.from([recipe_tags_key]);
    print("12");
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
