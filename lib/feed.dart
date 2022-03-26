import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Expanded(
      child: Container(
        color: constants.backgroundColor,
        /*padding: const EdgeInsets.only(right: 6, left: 6),*/
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 100,
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: constants.brown,
                          ),
                        ),
                      )),
                  childCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
