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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            primary: Colors.white,
            shape: const CircleBorder(),
            minimumSize: const Size.square(80),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.clear,
            color: Colors.green,
            size: 50,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 8,
            primary: Colors.white,
            shape: const CircleBorder(),
            minimumSize: const Size.square(80),
          ),
          child: const Icon(
            Icons.favorite,
            color: Colors.green,
            size: 50,
          ),
        )
      ],
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
          Row(
            
          )
        ]),
      ),
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
