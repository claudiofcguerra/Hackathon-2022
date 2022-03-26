class RecipeClass {
  String name;
  String description;
  String miscellaneous;
  int duration;
  double price;
  Evaluation quality;
  Difficulty difficulty;
  Ingredients ingredients;
  Instructions instructions;
  Equpiment equipment;

  RecipeClass(
      this.name,
      this.description,
      this.miscellaneous,
      this.duration,
      this.price,
      this.quality,
      this.difficulty,
      this.ingredients,
      this.instructions,
      this.equipment);
}

class Equpiment {
  List<String> equipment;

  Equpiment(this.equipment);
}

class Instructions {
  List<String> steps;

  Instructions(this.steps);
}

class Ingredients {
  Map<String, String> ingredientsPlusQuantity;

  Ingredients(this.ingredientsPlusQuantity);
}

class Difficulty {
  double difficulty;

  Difficulty(this.difficulty);
}

class Evaluation {
  double evaluation;

  Evaluation(this.evaluation);
}
