import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2022/assets/cut_out_text_painter.dart';
import 'package:hackathon_2022/perfil.dart';
import 'package:hackathon_2022/points.dart';
import 'package:hackathon_2022/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tcard/tcard.dart';
import 'package:hackathon_2022/recipeclass.dart';
import 'assets/constants.dart' as constants;
import 'favs.dart';
import 'feed.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  final TCardController _controller = TCardController();

  Widget _body = Container(
    color: constants.backgroundColor,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: constants.cardHeightTotal,
        ),
        const CircularProgressIndicator(
          color: constants.secondaryColor,
        ),
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      _body = _buildBody(context);
    });
  }

  @override
  Widget _buildBody(BuildContext context) {
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
          BuildCard(_controller),
          /*SizedBox(
            height: 5,
          ),*/
          BuildBottomRow(_controller),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}

class BuildBottomRow extends StatefulWidget {
  final TCardController _controller;

  const BuildBottomRow(
    this._controller, {
    Key? key,
  }) : super(key: key);

  @override
  State<BuildBottomRow> createState() => _BuildBottomRowState();
}

class _BuildBottomRowState extends State<BuildBottomRow> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: constants.backgroundColor,
              shape: const CircleBorder(),
              minimumSize: const Size.square(60),
            ),
            onPressed: () {
              widget._controller.forward(direction: SwipDirection.Left);
            },
            child: const Icon(
              Icons.clear,
              color: constants.secondaryColor,
              size: 30,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget._controller.forward(direction: SwipDirection.Right);
            },
            style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: constants.backgroundColor,
              shape: const CircleBorder(),
              minimumSize: const Size.square(60),
            ),
            child: const Icon(
              Icons.favorite,
              color: constants.secondaryColor,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

class BuildCard extends StatefulWidget {
  final TCardController _controller;

  const BuildCard(
    this._controller, {
    Key? key,
  }) : super(key: key);

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  List<RecipeClass> recipes = [];
  List<ClipRRect> cards = [];
  late ValueChanged<int> onChange;
  int index = 0;

  Widget _body = Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: constants.cardHeightTotal,
      ),
      const CircularProgressIndicator(
        color: constants.secondaryColor,
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    onChange = (value) {
      setState(() {
        index = value;
      });
    };
    constants.getRecipes().then((value) {
      recipes = value;
      _createCards();
    });
  }

  Widget _showCards(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (kDebugMode) {
            print(index);
          }
          if (recipes[index] != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Recipe(recipe: recipes[index])),
            );
          }
        },
        child: TCard(
          onForward: (index, info) {
            onChange(index);
            if (kDebugMode) {
              print(info.direction);
            }
            if (info.direction == SwipDirection.Right) {
              /*constants.favoriteRecipe(recipes[index - 1]);*/
              constants.favoriteRecipe(recipes[index - 1]);
              if (kDebugMode) {
                print('like');
              }
            } else {
              if (kDebugMode) {
                print('dislike');
              }
            }
          },
          controller: widget._controller,
          cards: cards,
        ),
      ),
    );
  }

  void _createCards() {
    cards = [];
    for (RecipeClass recipe in recipes) {
      cards.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BuildTotalCard(
            recipe: recipe,
          ),
        ),
      );
    }
    if (cards.isNotEmpty) {
      _body = _showCards(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}

class BuildTotalCard extends StatelessWidget {
  RecipeClass recipe;

  BuildTotalCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // Size(379.4, 513.9)
          width: constants.cardWidth,
          height: constants.cardHeightImage,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipe.foodpicurl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: constants.cardInfoHeight,
            width: 379.4,
            child: BuildCardInfo(
              recipe: recipe,
            ),
          ),
        ),
      ],
    );
  }
}

class BuildCardInfo extends StatefulWidget {
  final RecipeClass recipe;

  const BuildCardInfo({Key? key, required this.recipe}) : super(key: key);

  @override
  State<BuildCardInfo> createState() => _BuildCardInfoState();
}

class _BuildCardInfoState extends State<BuildCardInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.brown,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BuildCardInfoTopRow(recipe: widget.recipe),
          BuildCardInfoBottomRow(recipe: widget.recipe),
        ],
      ),
    );
  }
}

class BuildCardInfoBottomRow extends StatefulWidget {
  final RecipeClass recipe;

  const BuildCardInfoBottomRow({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<BuildCardInfoBottomRow> createState() => _BuildCardInfoBottomRowState();
}

class _BuildCardInfoBottomRowState extends State<BuildCardInfoBottomRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          type: MaterialType.transparency,
          child: Text(
            widget.recipe.formatPrice(),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: Row(
            children: [
              const Icon(
                Icons.timer,
                color: Colors.white,
                size: 18,
              ),
              Text(
                widget.recipe.duration.toString() + "m",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BuildCardInfoTopRow extends StatefulWidget {
  final RecipeClass recipe;

  const BuildCardInfoTopRow({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<BuildCardInfoTopRow> createState() => _BuildCardInfoTopRowState();
}

class _BuildCardInfoTopRowState extends State<BuildCardInfoTopRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          type: MaterialType.transparency,
          child: Text(
            widget.recipe.name,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: const [
            BuildDifficultyStars(),
          ],
        ),
      ],
    );
  }
}

class BuildDifficultyStars extends StatelessWidget {
  // TODO: Make this a for
  const BuildDifficultyStars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.star,
          color: Colors.white,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 15,
        ),
      ],
    );
  }
}

class BuildTopRow extends StatelessWidget {
  const BuildTopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              elevation: 0,
              primary: Colors.transparent),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FeedPage(),
              ),
            );
          },
          child: const Icon(
            Icons.home,
            color: constants.secondaryColor,
            size: 40,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              elevation: 0,
              primary: Colors.transparent),
          onPressed: () {},
          child: const Icon(
            Icons.search,
            color: constants.secondaryColor,
            size: 40,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              elevation: 0,
              primary: Colors.transparent),
          onPressed: () {
            /*if (constants.currentTab != "BOOKMARKS") {
              constants.currentTab = "BOOKMARKS";*/
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Favorites()),
            );
            /*}*/
          },
          child: const Icon(
            Icons.favorite_border,
            color: constants.secondaryColor,
            size: 40,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              elevation: 0,
              primary: Colors.transparent),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Perfil()),
            );
          },
          child: const Icon(
            Icons.account_circle,
            color: constants.secondaryColor,
            size: 40,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              elevation: 0,
              primary: Colors.transparent),
          onPressed: () {
            /*if (constants.currentTab != "POINTS") {*/
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PointsPage()),
            );
            /*  }*/
          },
          child: CustomPaint(
            painter: CutOutTextPainter(
              text: "380",
              backgroundColor: constants.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
