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
                        itemExtent: 150.0,
                        delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int count) => Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    padding: const EdgeInsetsDirectional.only(top:0),
                                    alignment: Alignment.center,
                                    color: Colors.brown[300],
                                    child: Material(
                                      child: Image.asset(
                                          "images/testPhotoBlack.jpg",
                                        fit: BoxFit.contain,
                                        alignment: AlignmentDirectional.centerStart,
                                      ),
                                      type: MaterialType.transparency,
                                      /*Text(
                                      'Ganhou 10 pontos',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),*/
                                    ),
                                  ),
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

