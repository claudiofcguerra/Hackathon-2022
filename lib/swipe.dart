import 'package:flutter/material.dart';
import 'package:hackathon_2022/assets/cut_out_text_painter.dart';
import 'package:hackathon_2022/assets/measure_size_render_object.dart';
import 'package:hackathon_2022/favs.dart';
import 'package:hackathon_2022/points.dart';
import 'assets/colors.dart' as constants;

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

class BuildCard extends StatefulWidget {
  const BuildCard({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  var widgetSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Draggable(
        feedback: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            // Size(379.4, 513.9)
            width: 379.4,
            height: 513.9,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/testphoto1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(children: [
            Expanded(
              child: MeasureSize(
                onChange: (Size size) {
                  setState(() {
                    widgetSize = size;
                    print(widgetSize);
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/testphoto1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const BuildCardInfo()
          ]),
        ),
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
          BuildCardInfoTopRow(),
          BuildCardInfoBottomRow(),
        ],
      ),
    );
  }
}

class BuildCardInfoBottomRow extends StatelessWidget {
  const BuildCardInfoBottomRow({
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

class BuildCardInfoTopRow extends StatelessWidget {
  const BuildCardInfoTopRow({
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
