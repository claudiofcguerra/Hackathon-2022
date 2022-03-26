import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void addRecipe(RecipeClass recipe) {
  CollectionReference recipes =
      FirebaseFirestore.instance.collection('Recipes');

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  recipes.add(recipe.toJson());
}

class RecipeClass {
  String name;
  String description;
  String miscellaneous;
  int duration;
  double price;
  String foodpicurl;
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
      this.foodpicurl,
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
        foodpicurl = json['foodpicurl'],
        quality = json['quality'],
        difficulty = json['difficulty'],
        ingredients = JSONConverter.fromStringToList(json['ingredients']),
        instructions = JSONConverter.fromStringToList(json['instructions']),
        equipment = JSONConverter.fromStringToList(json['equipment']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'miscellaneous': miscellaneous,
        'duration': duration,
        'price': price,
        'foodpicurl': foodpicurl,
        'quality': quality,
        'difficulty': difficulty,
        'ingredients': JSONConverter.listToString(ingredients),
        'instructions': JSONConverter.listToString(instructions),
        'equipment': JSONConverter.listToString(equipment)
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
