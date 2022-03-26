import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2022/assets/constants.dart' as constants;
import 'package:material_color_utilities/material_color_utilities.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/testFood1.jpeg'),
          fit: BoxFit.cover
      )
      ),
      child: Container(
        width: 300,
        height: 500,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)

          )
        ),


      ),
    );
  }
}