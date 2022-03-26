import 'package:flutter/material.dart';

class RecipeClass {
  String name;
  String description;
  String miscellaneous;
  int duration;
  double price;
  String foodPicUrl;
  int quality;
  int difficulty;
  List ingredients;
  List instructions;
  List equipment;

  RecipeClass(
      this.name,
      this.description,
      this.miscellaneous,
      this.duration,
      this.price,
      this.foodPicUrl,
      this.quality,
      this.difficulty,
      this.ingredients,
      this.instructions,
      this.equipment);

  RecipeClass.fromJSON(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        miscellaneous = json['miscellaneous'],
        duration = json['duration'],
        price = json['price'],
        foodPicUrl = json['foodPicUrl'],
        quality = json['quality'],
        difficulty = json['difficulty'],
        ingredients = json['ingredients'],
        instructions = json['instructions'],
        equipment = json['equipment'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'miscellaneous': miscellaneous,
        'duration': duration,
        'price': price,
        'foodPicUrl': foodPicUrl,
        'quality': quality,
        'difficulty': difficulty,
        'ingredients': ingredients,
        'instructions': instructions,
        'equipment': equipment
      };

  String formatPrice() {
    if (price - price.floor() != 0) {
      return price.toString() + "€";
    } else {
      return price.toInt().toString() + "€";
    }
  }
}
