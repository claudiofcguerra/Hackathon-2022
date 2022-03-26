import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2022/login.dart';
import 'package:hackathon_2022/submitRecipe.dart';
import 'package:hackathon_2022/swipe.dart';
import 'assets/constants.dart' as constants;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();


  constants.openRecipeDB().then(
        (_) {
      constants.openUserDB().then(
            (_) {
          if (FirebaseAuth.instance.currentUser != null) {
            // wrong call in wrong place!
            runApp(
              const MaterialApp(
                home: SwipePage(),
              ),
            );
          } else {
            runApp(
              const MaterialApp(
                home: LoginPage(),
              ),
            );
          }

        },
      );
    },
  );
}
