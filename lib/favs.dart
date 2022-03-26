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
                      expandedHeight: 150.0,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text('Demo'),
                      ),
                    ),

                    SliverList(
                      delegate: SliverChildListDelegate(
                          [
                            Image.asset("images/testPhotoBlack.jpg"),
                            Text("Cachorro"),
                            Image.asset("images/testPhotoBlack.jpg"),
                            Text("Cachorro2"),
                            Image.asset("images/testPhotoBlack.jpg"),
                            Text("Cachorro3"),
                          ]
                      ),
                    )

                  ]
              )
          )
      ),
    );

    /*return Container(
      color: Colors.white,
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              children: <Widget>[

                Container(
                  height: 200,
                  padding: const EdgeInsets.all(8),
                  child: const Material(
                      type: MaterialType.transparency,
                      child: Text('Teste 1')),
                  color: constants.primaryColor,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Material(
                      type: MaterialType.transparency,
                      child: Text('Teste 2')),
                  color: constants.primaryColor,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Material(
                      type: MaterialType.transparency,
                      child: Text('Teste 3')),
                  color: constants.primaryColor,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Material(
                    type: MaterialType.transparency,
                      child: Text('Teste 4')),
                  color: constants.primaryColor,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  */

  }
}
