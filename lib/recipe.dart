import 'package:flutter/material.dart';
import 'package:hackathon_2022/recipes.dart';
import "assets/constants.dart" as constants;

class Recipe extends StatefulWidget {
  final RecipeClass recipe;

  const Recipe({Key? key, required this.recipe}) : super(key: key);

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
              color: Colors.brown.shade300,
              child: Material(
                type: MaterialType.transparency,
                child: CustomScrollView(slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.brown,
                    pinned: true,
                    expandedHeight: 80.0,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: const EdgeInsetsDirectional.only(
                          start: 22, bottom: 16),
                      title: Text(widget.recipe.name),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Image.asset(widget.recipe.foodPicUrl),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  BuildRatingStars(),
                                  BuildDifficulty(),
                                ]),
                            BuildPriceAndTime(recipe: widget.recipe),
                          ],
                        ),
                      ),
                      const BuildNotes(),
                      const BuildDescription(),
                    ]),
                  )
                ]),
              ))),
    );
  }
}

class BuildPriceAndTime extends StatelessWidget {
  final RecipeClass recipe;

  const BuildPriceAndTime({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Material(
          type: MaterialType.transparency,
          child: Text(recipe.formatPrice(),
              style: const TextStyle(fontSize: 30.0, color: Colors.white)),
        ),
        Row(
          children: [
            Icon(
              Icons.timer,
              color: Colors.white,
              size: 18,
            ),
            Material(
              type: MaterialType.transparency,
              child: Text(recipe.duration.toString() + 'm',
                  style: const TextStyle(fontSize: 20.0, color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildRatingStars extends StatelessWidget {
  const BuildRatingStars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.star,
          color: Colors.white,
          size: 25,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 25,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 25,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 25,
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 25,
        ),
        Material(
          type: MaterialType.transparency,
          child: Text('  20 avaliações',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
        ),
      ],
    );
  }
}

class BuildDifficulty extends StatelessWidget {
  const BuildDifficulty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Icon(
          Icons.fastfood,
          color: Colors.white,
          size: 25,
        ),
        Icon(
          Icons.fastfood,
          color: Colors.white,
          size: 25,
        ),
        Icon(
          Icons.fastfood,
          color: Colors.white,
          size: 25,
        ),
        Material(
          type: MaterialType.transparency,
          child: Text('  Difícil',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
        ),
      ],
    );
  }
}

class BuildNotes extends StatelessWidget {
  const BuildNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        type: MaterialType.transparency,
        child: Text(
            'iaudsfhiupasdfh\nuahnsifdn\niqewhrquir\nquwirhuiwefndioshfnweo\n',
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
    );
  }
}

class BuildDescription extends StatelessWidget {
  const BuildDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        type: MaterialType.transparency,
        child: Text(
            'iaudsfhiupasdfh\nuahnsifdn\niqewhrquir\nquwirhuiwefndioshfnweo\n',
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
    );
  }
}
