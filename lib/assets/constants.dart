import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import '../recipeclass.dart';

Future<void> deleteRecipe(String id) async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Recipes');

  await _collectionRef.doc(id).delete();
}

Future<List<RecipeClass>?> getFavoriteRecipes(String uid) async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Users');

  DocumentSnapshot snap =
      await _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid).get();

  if (snap.exists) {
    var data = snap.data() as Map<String, dynamic>;
    List<dynamic> favoriteRecipesIDs = data['recipes'] as List<dynamic>;

    _collectionRef = FirebaseFirestore.instance.collection('Recipes');

    List<RecipeClass> l = [];

    for (String id in favoriteRecipesIDs) {
      DocumentSnapshot<Object?> doc = await _collectionRef.doc(id).get();
      var data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      l.add(RecipeClass.fromJSON(data));
      var debug = 1 + 1;
    }

    return l;
  } else {
    return null;
  }


}

Future<void> favoriteRecipe(RecipeClass recipe) async {

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Users');

  DocumentReference doc =
      _collectionRef.doc(FirebaseAuth.instance.currentUser!.uid);
  var l = [recipe.id];
  doc.update({"recipes": FieldValue.arrayUnion(l)});

  /*
  DocumentSnapshot snap = await doc.get();

  if (snap.exists) {
    var data = snap.data() as Map<String, dynamic>;
    List<dynamic> l = data['recipes'] as List<dynamic>;
    l.add(recipe.id!);
    doc.update({'recipes': l});
  } else {
    Map<String, dynamic> m = {};
    m['recipes'] = [recipe.id!];
    _collectionRef.add(m);
  }*/
}

Future<List<RecipeClass>> getRecipes() async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Recipes');

  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  List<RecipeClass> l = [];
  // Get data from docs and convert map to List
  for (var doc in querySnapshot.docs) {
    var data = doc.data() as Map<String, dynamic>;
    //data['id'] = doc.id;
    l.add(RecipeClass.fromJSON(data));
  }

  return l;
}

Future<void> addRecipe(RecipeClass recipe) async{

  CollectionReference recipes =
  FirebaseFirestore.instance.collection('Recipes');

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();

  CollectionReference users =
  FirebaseFirestore.instance.collection('Users');

  DocumentReference doc =
  users.doc(FirebaseAuth.instance.currentUser!.uid);

  DocumentReference docRef = await recipes.add(recipe.toJson());

  var l = [docRef.id];
  doc.update({"postedRecipes": FieldValue.arrayUnion(l)});




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
