import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2022/submitRecipe.dart';
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
            child: const BuildTopRow(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(),
          /*SizedBox(
            height: 5,
          ),*/
          buildFeedList(),
        ],
      ),
    );
  }

  buildFeedList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            constants
                .getFavoriteRecipes("PNxzZkaExpREb4iUau5yaSUDs183")
                .then((value) {
              var debug = 1 + 1;
            });
          },
          child: const Icon(
            Icons.search,
            color: constants.secondaryColor,
            size: 40,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SubmitRecipe()),
            );
          },
          child: const Icon(
            Icons.add,
            color: constants.secondaryColor,
            size: 40,
          ),
        ),
      ],
    );
  }
}
