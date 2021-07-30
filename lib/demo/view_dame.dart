import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewDame extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PageView(
      // 是否启用弹性效果，默认true
      pageSnapping: true,
      // 页面滚动方向
      scrollDirection: Axis.vertical,
      onPageChanged: (currentIndex) => debugPrint("current page: $currentIndex"),

      children: [
        Container(
           color: Colors.grey[900],
          alignment: Alignment(0.0,0.0),
          child: Text(
            "One",
            style: TextStyle(fontSize: 32.0, color: Colors.deepOrangeAccent),
          ),
        ),
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0,0.0),
          child: Text(
            "Two",
            style: TextStyle(fontSize: 32.0, color: Colors.deepOrangeAccent),
          ),
        ),
        Container(
          color: Colors.deepOrange[900],
          alignment: Alignment(0.0,0.0),
          child: Text(
            "Three",
            style: TextStyle(fontSize: 32.0, color: Colors.deepOrangeAccent),
          ),
        )
      ],
    );
  }
}