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
    return Scaffold(
      body: Stack(
        children: [
           Container(
              width: double.infinity,
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/testFood1.jpeg"), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 200,
                  bottom: 200,
                  left: 75,
                  right: 75
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                    ),
                    color: Colors.brown[300]
                  ),
                  child: Column(
                    children: const [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                              Icons.perm_identity,
                            color: Colors.white70,
                          ),
                          contentPadding: EdgeInsets.all(5),
                          //hintText: 'username',
                          labelText: 'username',
                          labelStyle: TextStyle(
                            color: Colors.white70
                          )
                        ),

                      )
                    ],
                  ),
                ),
              ),
           )
        ],
      ),
    );
    /*return Container(
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/testFood1.jpeg"), fit: BoxFit.cover)),
      child: SafeArea(

      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            child: Column(
                children: [
                    Container(
                      color: Colors.brown[300],
                    )
                    ],
                ),
          ),
        ),
      )
    );*/
  }
}
