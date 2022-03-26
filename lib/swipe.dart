import 'package:flutter/material.dart';
import 'package:hackathon_2022/assets/cut_out_text_painter.dart';
import 'package:hackathon_2022/favs.dart';
import 'package:hackathon_2022/points.dart';
import 'package:hackathon_2022/recipes.dart';
import 'package:tcard/tcard.dart';
import 'assets/constants.dart' as constants;

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.backgroundColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          SafeArea(
            child: BuildTopRow(),
          ),
          SizedBox(
            height: 10,
          ),
          BuildCard(),
          /*SizedBox(
            height: 5,
          ),*/
          BuildBottomRow(),
        ],
      ),
    );
  }
}

class BuildBottomRow extends StatelessWidget {
  const BuildBottomRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        /*padding: const EdgeInsets.only(top: 1),*/
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
              onPressed: () {},
              child: const Icon(
                Icons.clear,
                color: constants.secondaryColor,
                size: 30,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
      ),
    );
  }
}

class BuildCard extends StatelessWidget {
  const BuildCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TCard(
        cards: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const BuildTotalCard(),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const BuildTotalCard(),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const BuildTotalCard(),
          ),
        ],
      ),
    );
  }
}

class BuildTotalCard extends StatelessWidget {
  const BuildTotalCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // Size(379.4, 513.9)
          width: constants.cardWidth,
          height: constants.cardHeightImage,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/testphoto1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: constants.cardInfoHeight,
            width: 379.4,
            child: BuildCardInfo(),
          ),
        ),
      ],
    );
  }
}

class BuildCardInfo extends StatefulWidget {
  final recipe = RecipeClass(
    "Bacalhau com Natas",
    "",
    "",
    3,
    90,
    AssetImage('images/testphoto1.jpg'),
    Evaluation(5),
    Difficulty(3),
    Ingredients(new Map()),
    Instructions([""]),
    Equpiment([""]),
  );

  BuildCardInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildCardInfo> createState() => _BuildCardInfoState();
}

class _BuildCardInfoState extends State<BuildCardInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown.shade300,
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
  RecipeClass recipe;

  BuildCardInfoBottomRow({
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
  RecipeClass recipe;

  BuildCardInfoTopRow({
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
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 20,
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
          onPressed: () {},
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Favorites()),
            );
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
          onPressed: () {},
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PointsPage()),
            );
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
