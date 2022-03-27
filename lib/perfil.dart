import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2022/favs.dart';
import 'package:hackathon_2022/points.dart';
import 'login.dart';
import 'recipeclass.dart';
import 'assets/constants.dart' as constants;

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late List<RecipeClass> perfilList;

  @override
  void initState() {
    _getPerfil();
  }

  void _getPerfil() async {
    List<RecipeClass> l = [
      RecipeClass(
          "nameasd",
          "PNxzZkaExpREb4iUau5yaSUDs183",
          "descriptionasd",
          "miscellaneousasd",
          55,
          44.1,
          "images/testphoto2.jpg",
          1,
          2,
          "f",
          "c"),
      RecipeClass(
          "nameasd",
          "PNxzZkaExpREb4iUau5yaSUDs183",
          "descriptionasd",
          "miscellaneousasd",
          55,
          44.1,
          "images/testphoto2.jpg",
          1,
          2,
          "f",
          "c"),
    ];

    setState(() {
      _listBuild(context, l);
    });
  }

  void _listBuild(BuildContext context, List<RecipeClass> l) {
    _body = Container(
        padding: const EdgeInsetsDirectional.only(top: 0),
        alignment: Alignment.center,
        color: constants.backgroundColor,
        child: CustomScrollView(slivers: [
          const SliverAppBar(
            forceElevated: true,
            elevation: 10,
            shadowColor: Colors.grey,
            pinned: true,
            backgroundColor: Colors.brown,
            expandedHeight: 80.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Perfil'),
            ),
          ),
          SliverFixedExtentList(
              itemExtent: 150,
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int count) => (count == 0)
                      ? Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 20.0, 8.0, 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PointsPage()),
                              );
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: constants.brown,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20.0, 0, 0, 0),
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/testphoto2.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(30, 0, 15, 0),
                                              child: Material(
                                                type: MaterialType.transparency,
                                                child: Text(
                                                  'Rodrigo Gonçalves',
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(30, 0, 15, 0),
                                              child: Material(
                                                type: MaterialType.transparency,
                                                child: Text(
                                                  '20 pontos',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    )
                                  ],
                                )),
                          ),
                        )
                      : (count == 1)
                          ? Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 30, 0, 0),
                              child: Column(
                                children: [
                                  const Material(
                                    type: MaterialType.transparency,
                                    child: Text(
                                      'Lista de Receitas',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32),
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 3.0,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        splashFactory: NoSplash.splashFactory,
                                        elevation: 0,
                                        primary: Colors.transparent),
                                    onPressed: () {
                                      FirebaseAuth.instance.signOut();
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.person_remove,
                                      color: constants.secondaryColor,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : BuildRecipeCard(l: l, count: count),
                  childCount: 2 + l.length)),
        ]));
  }

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
    return _body;
  }
}

class BuildRecipeCard extends StatelessWidget {
  BuildRecipeCard(
      {Key? key,
      required this.l,
      required this.count //required this.myController
      })
      : super(key: key);

  List<RecipeClass> l;
  int count;

  Widget stars(RecipeClass rc) {
    return Row(
      children: [
        for (int i = 1; i <= rc.quality; i++)
          const Icon(
            Icons.star,
            color: Colors.black,
            size: 25,
          ),
        for (int i = rc.quality + 1; i <= 5; i++)
          const Icon(
            Icons.star_outline,
            color: Colors.black,
            size: 25,
          ),
      ],
    );
  }

  Widget food(RecipeClass rc) {
    return Row(
      children: [
        for (int i = 1; i <= rc.difficulty; i++)
          const Icon(
            Icons.fastfood,
            color: Colors.black,
            size: 25,
          ),
        for (int i = rc.difficulty + 1; i <= 3; i++)
          const Icon(
            Icons.fastfood_outlined,
            color: Colors.black,
            size: 25,
          ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsetsDirectional.only(top: 0),
        alignment: Alignment.center,
        color: constants.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              l[count - 2].foodpicurl,
              fit: BoxFit.fill,
              alignment: Alignment.centerLeft,
            ),
            Expanded(
                child: Container(
              height: 1000.0,
              width: 250.0,
              padding: const EdgeInsetsDirectional.only(end: 2),
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                        type: MaterialType.transparency,
                        child: Text(l[count - 2].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold))),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                              type: MaterialType.transparency,
                              child: Text(l[count - 2].formatPrice(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20))),
                          stars(l[count - 2]),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            type: MaterialType.transparency,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.timer,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                Text(
                                  l[count - 2].duration.toString() + "m",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          food(l[count - 2])
                        ]),
                  ]),
            ))
          ],
        ),
      ),
    );
  }
}
