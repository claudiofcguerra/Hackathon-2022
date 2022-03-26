import 'package:flutter/material.dart';
import 'assets/constants.dart' as constants;


void main() {
  runApp(
    const MaterialApp(
      home: Favorites(),
    ),
  );
}



class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              child: CustomScrollView(
                  slivers: [
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
                                    child: ClipRRect (
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container (
                                            padding: const EdgeInsetsDirectional.only(top:0),
                                            alignment: Alignment.center,
                                            color: constants.backgroundColor,
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: FittedBox(
                                                    fit: BoxFit.contain, // otherwise the logo will be tiny
                                                    child: Image.asset("images/testFood1.jpeg"),
                                                    alignment: Alignment.centerLeft,
                                                  ),
                                                ),

                                                Container(
                                                    padding: const EdgeInsetsDirectional.only(end:6),
                                                    child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: const [
                                                          Material(
                                                              type: MaterialType.transparency,
                                                              child: Text('Sopa de Grelos', textAlign: TextAlign.center,
                                                                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))
                                                          ),
                                                          Material(
                                                              type: MaterialType.transparency,
                                                              child: Text('Preço: ', textAlign: TextAlign.center,
                                                                  style: TextStyle(fontSize: 20))
                                                          )
                                                        ]
                                                    )
                                                )


                                              ],
                                            )
                                        )
                                    )
                                ),
                          childCount: 10
                        ),
                    ),
                  ]
              )
          )
      ),
    );


  }
}

