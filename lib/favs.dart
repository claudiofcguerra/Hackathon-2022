import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2022/recipe.dart';
import 'assets/constants.dart';
import 'recipeclass.dart';
import 'assets/constants.dart' as constants;

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late List<RecipeClass> favoritesList;

  @override
  void initState() {
    super.initState();

    constants.getFavoriteRecipes(FirebaseAuth.instance.currentUser!.uid).then(
      (value) {
        if (value != null) {
          favoritesList = value;
        } else {
          favoritesList = [];
        }

        setState(() {
          _listBuild(context);
        });
      },
    );
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
          child: Container(
            color: constants.backgroundColor,
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
                          child: GestureDetector(
                            onTap: () {
                              /*addRecipe(favoritesList[count]);*/
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Recipe(
                                    recipe: favoritesList[count],
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding:
                                    const EdgeInsetsDirectional.only(top: 0),
                                alignment: Alignment.center,
                                color: constants.backgroundColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Image.asset(
                                      // TODO: Forçar isto para ficar num square
                                      favoritesList[count].foodpicurl,
                                      fit: BoxFit.fill,
                                      alignment: Alignment.centerLeft,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 1000.0,
                                        width: 250.0,
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                end: 2),
                                        alignment: Alignment.center,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: Text(
                                                      favoritesList[count].name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 23,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Material(
                                                        type: MaterialType
                                                            .transparency,
                                                        child: Text(
                                                            favoritesList[count]
                                                                .formatPrice(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        20))),

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
                                                        children: [
                                                          const Icon(
                                                            Icons.timer,
                                                            color: Colors.black,
                                                            size: 18,
                                                          ),
                                                          Text(
                                                            favoritesList[count]
                                                                    .duration
                                                                    .toString() +
                                                                "m",
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                        ),
                    childCount: favoritesList.length),
              ),
            ]),
          )),
    );
  }
}
