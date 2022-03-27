import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import '../recipeclass.dart';

Future<void> getRecipes() async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Recipes');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  List<RecipeClass> l = [];
  // Get data from docs and convert map to List
  for (var doc in querySnapshot.docs) {
    var data = doc.data() as Map<String, dynamic>;
    l.add(RecipeClass.fromJSON(data));
  }
}

void addRecipe(RecipeClass recipe) {
  CollectionReference recipes =
      FirebaseFirestore.instance.collection('Recipes');

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  recipes.add(recipe.toJson());
}

String currentTab = "SWIPE";
Color brown = Colors.brown.shade300;
const Color primaryColor = Color(0xFF12B878);
const Color secondaryColor = Color(0xFF358566);
const Color backgroundColor = Colors.white;
const double cardWidth = 379.4;
const double cardHeightImage = 513.8;
const double cardHeightTotal = 576.8;
const double cardInfoHeight = cardHeightTotal - cardHeightImage;
