import 'package:flutter/material.dart';
import 'package:hackathon_2022/recipe.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'recipes.dart';
import 'assets/constants.dart' as constants;

class Favorites extends StatefulWidget {
  Database database;

  Favorites(this.database, {Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final recipe = RecipeClass(
    0,
    "Bacalhau com Natas",
    "",
    "",
    3,
    90,
    'images/testphoto1.jpg',
    5,
    3,
    [""],
    [""],
    [""],
  );

  @override
  void initState() {
    setState(() {
      _listBuild(context);
    });
  }

  Widget _body = Stack(
    alignment: Alignment.center,
    children: const [
      CircularProgressIndicator(
        color: constants.secondaryColor,
      ),
    ],
  );

  void _listBuild(BuildContext context) {
    _body = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Recipe(
                          recipe: recipe,
                        )),
              );
            },
            child: CustomScrollView(slivers: [
              const SliverAppBar(
                pinned: true,
                backgroundColor: constants.secondaryColor,
                expandedHeight: 80.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Lista de Favoritos'),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 170.0,
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int count) => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsetsDirectional.only(top: 0),
                              alignment: Alignment.center,
                              color: constants.backgroundColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset(
                                    "images/testFood1.jpeg",
                                    fit: BoxFit.fill,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 1000.0,
                                      width: 250.0,
                                      padding: const EdgeInsetsDirectional.only(
                                          end: 2),
                                      alignment: Alignment.center,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Material(
                                                type: MaterialType.transparency,
                                                child: Text('Sopa de Grelos',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Material(
                                                      type: MaterialType
                                                          .transparency,
                                                      child: Text('90€',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 20))),

                                                  /*const SizedBox(
                                                            width: 5,
                                                          ),*/

                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.black,
                                                        size: 15,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.black,
                                                        size: 15,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.black,
                                                        size: 15,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.black,
                                                        size: 15,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.black,
                                                        size: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Material(
                                                    type: MaterialType
                                                        .transparency,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons.timer,
                                                          color: Colors.black,
                                                          size: 18,
                                                        ),
                                                        Text(
                                                          "3m",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  /*const SizedBox(
                                                            width: 5,
                                                          ),*/

                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      /*children: <Widget>[];
                                                          for(var i = 0; i < 3; i++) {
                                                            children.add(
                                                              Icon(
                                                                Icons.fastfood,
                                                                color: Colors.black,
                                                                size: 20,
                                                              )
                                                            );
                                                          }*/

                                                      children: const [
                                                        Icon(
                                                          Icons.fastfood,
                                                          color: Colors.black,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.fastfood,
                                                          color: Colors.black,
                                                          size: 20,
                                                        ),
                                                        Icon(
                                                          Icons.fastfood,
                                                          color: Colors.black,
                                                          size: 20,
                                                        )
                                                      ]),
                                                ])
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    childCount: 10),
              ),
            ]),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}
