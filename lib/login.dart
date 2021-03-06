import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon_2022/assets/constants.dart' as constants;
import 'package:hackathon_2022/swipe.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/fundo.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 200, bottom: 200, left: 75, right: 75),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.brown[300]?.withOpacity(0.95)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            scale: 10.0,
                            image: AssetImage(
                              'images/fcggvhj.png'
                            )
                          )
                        ),

                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                      child: TextFormField(
                        controller: usernameController,
                        style: const TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                          ),
                          filled: true,
                          fillColor: Colors.brown[200],
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                          ),
                          prefixIcon: const Icon(
                            Icons.perm_identity,
                            color: Colors.white70,
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          //hintText: 'username',
                          hintText: 'Username',
                          hintStyle: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white70),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                          ),
                          filled: true,
                          fillColor: Colors.brown[200],
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white70,
                          ),
                          contentPadding: const EdgeInsets.all(5),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        children: [
                          Checkbox(value: false, onChanged: (bool) {}),
                          Text(
                            'Remember me',
                            style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown[200],
                          fixedSize: const Size(75, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          _login();
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown[200],
                          fixedSize: const Size(75, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          _signup();
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: usernameController.value.text,
          password: passwordController.value.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SwipePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    )
                ),
                backgroundColor: Colors.brown[300],
                content: Builder(
                  builder: (context) {
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;
                    return Container(
                      alignment: Alignment.bottomCenter,
                      height: height - 700,
                      width:  width - 175,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text(
                          'Username does not exist, please try again.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white70,

                              )),
                        ),
                      ),
                    );
                  },
                ) ,
                actions: <Widget>[
                  ButtonTheme(
                    minWidth: 70,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          passwordController.clear();
                          usernameController.clear();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Try again',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.white70,
                              )),
                        )),
                  )
                ],
              );
            }
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    )
                ),
                backgroundColor: Colors.brown[300],
                content: Builder(
                  builder: (context) {
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;
                    return Container(
                      alignment: Alignment.bottomCenter,
                      height: height - 700,
                      width:  width - 175,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text(
                          'Wrong username or password, please try again.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white70,

                              )),
                        ),
                      ),
                    );
                  },
                ) ,
                actions: <Widget>[
                  ButtonTheme(
                    minWidth: 70,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          passwordController.clear();
                          usernameController.clear();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Try again',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.white70,
                              )),
                        )),
                  )
                ],
              );
            }
        );
        print('Wrong password provided for that user.');
      } else if (e.code == "invalid-email") {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    )
                ),
                backgroundColor: Colors.brown[300],
                content: Builder(
                  builder: (context) {
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;
                    return Container(
                      alignment: Alignment.bottomCenter,
                      height: height - 700,
                      width:  width - 175,
                      child: Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Text(
                          'Invalid email, please provide a valid email address.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white70,

                              )),
                        ),
                      ),
                    );
                  },
                ) ,
                actions: <Widget>[
                  ButtonTheme(
                    minWidth: 70,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          passwordController.clear();
                          usernameController.clear();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Try again',
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                fontSize: 17,
                                color: Colors.white70,
                              )),
                        )),
                  )
                ],
              );
            }
        );
        print('cona');
      }
    }
  }

  void _showAlertDialog(String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(10)
                )
            ),
            backgroundColor: Colors.brown[300],
            content: Builder(
              builder: (context) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;
                return Container(
                  alignment: Alignment.bottomCenter,
                  height: height - 700,
                  width:  width - 175,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white70,

                          )),
                    ),
                  ),
                );
              },
            ) ,
            actions: <Widget>[
              ButtonTheme(
                minWidth: 70,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      passwordController.clear();
                      usernameController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Try again',
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.white70,
                          )),
                    )),
              )
            ],
          );
        }
    );
  }

  Future<void> _signup() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: usernameController.value.text,
          password: passwordController.value.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SwipePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
