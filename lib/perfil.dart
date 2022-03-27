import 'package:flutter/material.dart';
import 'package:hackathon_2022/recipe.dart';
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
    // Get a reference to the database.
    final db = constants.recipeDatabase;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('recipes');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    perfilList = List.generate(maps.length, (i) {
      return RecipeClass.fromJSON(maps[i]);
    });

    setState(() {
      _listBuild(context);
    });
  }

  void _listBuild(BuildContext context) {
    _body = Container(
        padding: const EdgeInsetsDirectional.only(top: 0),
        alignment: Alignment.center,
        color: constants.backgroundColor,
        child: CustomScrollView(slivers: [
          const SliverAppBar(
            pinned: true,
            backgroundColor: constants.secondaryColor,
            expandedHeight: 80.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Perfil'),
            ),
          ),
          SliverFixedExtentList(
              itemExtent: 150,
              delegate: SliverChildBuilderDelegate((BuildContext context, int count) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0, 0, 0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration:  const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  const [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 15, 0),
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Text ('Rodrigo Gonçalves',
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                              fontSize: 22
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 15, 0),
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Text ('20 pontos',
                                          style: TextStyle(
                                              fontSize: 22
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            )
                          ],
                        )
                    ),
                  )
              )
          ),


        ]
        )
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

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}


