import 'package:flutter/material.dart';
import 'package:hackathon_2022/submitRecipe.dart';
import 'package:hackathon_2022/swipe.dart';
import 'assets/constants.dart' as constants;

void main() {
  constants.openDB().then((_) {
    runApp(
      const MaterialApp(
        home: SwipePage(),
      ),
    );
  });
}
