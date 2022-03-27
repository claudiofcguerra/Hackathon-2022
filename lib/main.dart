import 'package:flutter/material.dart';
import 'package:hackathon_2022/feed.dart';
import 'package:hackathon_2022/submitRecipe.dart';
import 'package:hackathon_2022/swipe.dart';
import 'assets/constants.dart' as constants;

void main() {
  constants.openRecipeDB().then(
    (_) {
      constants.openUserDB().then(
        (_) {
          runApp(
            const MaterialApp(
              home: FeedPage(),
            ),
          );
        },
      );
    },
  );
}
