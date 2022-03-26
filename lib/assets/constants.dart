import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

Future<Database> openRecipeDB() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  var db = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      path.join(await getDatabasesPath(), 'recipes_database.db'),
      onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE recipes(id INTEGER PRIMARY KEY, name TEXT, description TEXT,'
      'miscellaneous TEXT, duration INTEGER, price REAL, foodpicurl TEXT,'
      'quality INTEGER, difficulty INTEGER, ingredients TEXT, '
      'instructions TEXT, equipment TEXT)',
    );
  },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1);
  db.then((value) {
    recipeDatabase = value;
  });
  return db;
}

Future<Database> openUserDB() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  var db = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      path.join(await getDatabasesPath(), 'users_database.db'),
      onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, userid INTEGER,'
      'email TEXT, password TEXT, profilepicurl TEXT)',
    );
  },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1);
  db.then((value) {
    userDatabase = value;
  });
  return db;
}

late Database userDatabase;
late Database recipeDatabase;
String currentTab = "SWIPE";
Color brown = Colors.brown.shade300;
const Color primaryColor = Color(0xFF12B878);
const Color secondaryColor = Color(0xFF358566);
const Color backgroundColor = Colors.white;
const double cardWidth = 379.4;
const double cardHeightImage = 513.8;
const double cardHeightTotal = 576.8;
const double cardInfoHeight = cardHeightTotal - cardHeightImage;
