import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2022/assets/colors.dart' as constants;

class PointsPage extends StatefulWidget {
  const PointsPage({Key? key}) : super(key: key);

  @override
  State<PointsPage> createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.backgroundColor,
      padding: const EdgeInsets.only(right: 6, left: 6),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            elevation: 10,
            shadowColor: Colors.grey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              )
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
          SliverFixedExtentList(
            itemExtent: 100,
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(top:15),
                    child: Container(
                      //padding: const EdgeInsetsDirectional.only(top:10),
                      //alignment: const Alignment(-0.8, 0.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF9F8F3),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0,5),
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            type: MaterialType.transparency,
                            child: Text(
                              'Compra',
                              //textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown[300]
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '+10',
                                  style: TextStyle(
                                    color: Colors.brown[300],
                                    fontSize: 30,
                                   fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.auto_awesome,
                                color: Colors.brown[300],
                              )
                            ]
                          ),
                        ],
                      )
                    )
                  ),
              childCount: 10
              ),
          ),
        ],
      ),
    );
  }
}