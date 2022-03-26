import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      resizeToAvoidBottomInset: false,
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
                    color: Colors.brown[300]?.withOpacity(0.95)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.white70
                          ),
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              filled: true,
                              fillColor: Colors.brown[200],
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                                )
                            ),
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
                        child: TextFormField(
                          obscureText: true,
                          style: const TextStyle(
                              color: Colors.white70
                          ),
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              filled: true,
                              fillColor: Colors.brown[200],
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                                  )
                              ),
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          children: [
                            Checkbox(
                                value: false,
                                onChanged: (bool) {}
                            ),
                            Text(
                              'Remember me',
                              style: GoogleFonts.raleway(
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70,
                                  )
                              ),
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
                          onPressed: () {  },

                          child: Text(
                            'Login',
                            style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white70,
                                )
                            ),
                          ),

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
