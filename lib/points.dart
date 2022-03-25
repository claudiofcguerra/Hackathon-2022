import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointsPage extends StatefulWidget {
  const PointsPage({Key? key}) : super(key: key);

  @override
  State<PointsPage> createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
              ),
            pinned: true,
            backgroundColor: Colors.brown.shade300,
            expandedHeight: 125.0,
            flexibleSpace: const FlexibleSpaceBar(
              expandedTitleScale: 2,
              centerTitle: true,
              //titlePadding: EdgeInsetsDirectional.only(start: 112.5, bottom: 75),
              title: Text(
                '380',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Lucida'
                ),
              ),
            ),
         ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.only(top: 15),
            sliver: SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsetsDirectional.only(top:0),

                          alignment: Alignment.center,
                          color: Colors.brown[300],
                          child: const Material(
                            type: MaterialType.transparency,
                            child: Text(
                                'Ganhou 10 pontos',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
              ),
                ),
          )
        ],
      ),
    );
  }
}