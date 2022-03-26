import 'package:flutter/material.dart';
import 'package:hackathon_2022/recipe.dart';
import 'recipeclass.dart';
import 'assets/constants.dart' as constants;

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  Widget _body = Stack(
    alignment: Alignment.center,
    children: const [
      CircularProgressIndicator(
        color: constants.secondaryColor,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(child: _body);
  }
}