import 'package:flutter/material.dart';
import "assets/colors.dart" as constants;

class Recipe extends StatefulWidget{
  const Recipe({Key? key}) : super(key: key);
  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
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
                        [ Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/testphoto1.jpg")
                        ),
                          Text("Cachorro"),

                        ]
                      ),
                    )
                  ]
              )
          )
      ),
    );
  }
}