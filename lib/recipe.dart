import 'package:flutter/material.dart';
import 'package:hackathon_2022/recipeclass.dart';
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
                    expandedHeight: 70.0,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: const EdgeInsetsDirectional.only(
                          start: 42, bottom: 16),
                      title: Text(widget.recipe.name),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Image.asset(widget.recipe.foodpicurl),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BuildRatingStars(recipe: widget.recipe,),
                                  BuildDifficulty(recipe: widget.recipe,),
                                ]),
                            BuildPriceAndTime(recipe: widget.recipe),
                          ],
                        ),
                      ),
                      BuildNotes(recipe: widget.recipe),
                      BuildDescription(recipe: widget.recipe),
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
            const Icon(
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
  final RecipeClass recipe;

  const BuildRatingStars({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  Widget stars(int s) {
      return Row(
        children: [
          for (int i = 0; i < s; i++)
            const Icon(
              Icons.star,
              color: Colors.white,
              size: 25,
            ),
        ],
      );
    }

  @override
  Widget build(BuildContext context) {
    return stars(recipe.quality);
  }
}

class BuildDifficulty extends StatelessWidget {
  final RecipeClass recipe;

  const BuildDifficulty({
    Key? key,
    required this.recipe,
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
      ],
    );
  }
}

class BuildNotes extends StatelessWidget {
  final RecipeClass recipe;

  const BuildNotes({
    Key? key,
    required this.recipe,
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
  final RecipeClass recipe;

  const BuildDescription({
    Key? key,
    required this.recipe,
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
