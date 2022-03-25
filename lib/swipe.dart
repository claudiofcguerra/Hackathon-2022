import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          SafeArea(
            child: BuildTopRow(),
          ),
          SizedBox(
            height: 5,
          ),
          BuildCard(),
          SizedBox(
            height: 5,
          ),
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
    return Container(
      padding: EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: Colors.white,
              shape: const CircleBorder(),
              minimumSize: const Size.square(60),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.clear,
              color: Colors.green,
              size: 30,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: Colors.white,
              shape: const CircleBorder(),
              minimumSize: const Size.square(60),
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.green,
              size: 30,
            ),
          )
        ],
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/testphoto1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          BuildCardInfo()
        ]),
      ),
    );
  }
}

class BuildCardInfo extends StatelessWidget {
  const BuildCardInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown.shade300,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: const [
          buildCardInfoTopRow(),
          buildCardInfoBottomRow(),
        ],
      ),
    );
  }
}

class buildCardInfoBottomRow extends StatelessWidget {
  const buildCardInfoBottomRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Material(
          type: MaterialType.transparency,
          child: Text(
            "90€",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: Row(
            children: const [
              Icon(
                Icons.timer,
                color: Colors.white,
                size: 18,
              ),
              Text(
                "3m",
                style: TextStyle(
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

class buildCardInfoTopRow extends StatelessWidget {
  const buildCardInfoTopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Material(
          type: MaterialType.transparency,
          child: Text(
            "Bacalhau com Natas",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          children: const [
            buildDifficultyStars(),
          ],
        ),
      ],
    );
  }
}

class buildDifficultyStars extends StatelessWidget {
  const buildDifficultyStars({
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
            elevation: 8,
            primary: Colors.transparent,
            shape: const CircleBorder(),
            minimumSize: const Size.square(40),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.home,
            color: Colors.green,
            size: 40,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            primary: Colors.transparent,
            shape: const CircleBorder(),
            minimumSize: const Size.square(40),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.search,
            color: Colors.green,
            size: 40,
          ),
        )
      ],
    );
  }
}
