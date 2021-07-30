import 'package:flutter/material.dart';
import 'package:flutter_grit/model/post.dart';

class ViewDame extends StatelessWidget{
  Widget _pageItemBuilder(BuildContext context, int index){
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  posts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  posts[index].author,
                ),
              ],
            )
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
        itemBuilder: _pageItemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PageView(
      // 是否启用弹性效果，默认true
      pageSnapping: true,
      // 页面滚动方向
      scrollDirection: Axis.vertical,
      onPageChanged: (currentIndex) => debugPrint("current page: $currentIndex"),
      controller: PageController(
        initialPage: 1,
        // 页面占用可视区域比例，默认1.0
        viewportFraction: 0.85,
      ),
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