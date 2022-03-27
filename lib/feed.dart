import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2022/recipe.dart';
import 'package:hackathon_2022/recipeclass.dart';
import 'package:hackathon_2022/swipe.dart';
import 'assets/constants.dart' as constants;

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.backgroundColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SafeArea(
            child: BuildTopRow(),
          ),
          const SizedBox(
            height: 10,
          ),
          buildFeedList(),
        ],
      ),
    );
  }
  buildFeedList() {
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 350,
            delegate: SliverChildBuilderDelegate(
                (context, index) => buildPost(index),
                childCount: 10),
          ),
        ],
      ),
    );
  }
  buildPost(int index) {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => Recipe(recipe: RecipeClass(0, "nameasd", "descriptionasd", "miscellaneousasd", 55, 44.1, "images/testphoto2.jpg", 1, 2, ["f"], ["c"], ["a"]))),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: constants.brown,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            height: 70,
                            width: 70,
                            decoration:  const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              image: DecorationImage(
                                image: AssetImage(
                                    'images/testphoto2.jpg'),
                                    //posts[index].user.pic),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                        ),
                          ),
                          const Material(
                            type: MaterialType.transparency,
                            child: Text("Utilizador",
                                //Text(posts[index].user.userid),
                                style: TextStyle(fontSize: 20.0, color: Colors.white)),
                          ),
                          ]
                      ),
                      Expanded(
                        child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              decoration:  const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/testFood1.jpeg'),
                                  //Image.file(posts[index].recipe.foodpicurl)
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        BuildRatingStars(recipe: RecipeClass(0, "nameasd", "descriptionasd", "miscellaneousasd", 55, 44.1, "images/testphoto2.jpg", 1, 2, ["f"], ["c"], ["a"])),
                                        BuildDifficulty(recipe: RecipeClass(0, "nameasd", "descriptionasd", "miscellaneousasd", 55, 44.1, "images/testphoto2.jpg", 1, 2, ["f"], ["c"], ["a"])),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        BuildPriceAndTime(recipe: RecipeClass(0, "nameasd", "descriptionasd", "miscellaneousasd", 55, 44.1, "images/testphoto2.jpg", 1, 2, ["f"], ["c"], ["a"])),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
          )
    );
  }
}
