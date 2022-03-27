import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecipeClass {
  String name;
  String uid;
  String description;
  String miscellaneous;
  int duration;
  double price;
  String foodpicurl;
  int quality;
  int difficulty;
  String ingredients;
  String instructions;

  RecipeClass(
    this.name,
    this.uid,
    this.description,
    this.miscellaneous,
    this.duration,
    this.price,
    this.foodpicurl,
    this.quality,
    this.difficulty,
    this.ingredients,
    this.instructions,
  );

  RecipeClass.fromJSON(Map<String, dynamic> json)
      : name = json['name'],
        uid = json['uid'],
        description = json['description'],
        miscellaneous = json['miscellaneous'],
        duration = json['duration'],
        price = json['price'],
        foodpicurl = json['foodpicurl'],
        quality = json['quality'],
        difficulty = json['difficulty'],
        ingredients = json['ingredients'],
        instructions = json['instructions'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'description': description,
        'miscellaneous': miscellaneous,
        'duration': duration,
        'price': price,
        'foodpicurl': foodpicurl,
        'quality': quality,
        'difficulty': difficulty,
        'ingredients': ingredients,
        'instructions': instructions,
      };

  String formatPrice() {
    if (price - price.floor() != 0) {
      return price.toString() + "€";
    } else {
      return price.toInt().toString() + "€";
    }
  }
}

class JSONConverter {
  static List<String> fromStringToList(String json) {
    return json.split("//");
  }

  static String listToString(List equipment) {
    String _final = "";
    for (String value in equipment) {
      _final += value + "//";
    }
    return _final;
  }
}
