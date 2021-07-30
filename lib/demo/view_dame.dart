import 'package:flutter/material.dart';
import 'package:flutter_grit/model/post.dart';

class ViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridViewExtentBuilderDemo();
  }
}

class GridViewExtentBuilderDemo extends StatelessWidget{
  List<Widget> _buildTiles(int length) {
    return List.generate(
      length,
      // index item项目的索引
          (index) => Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          "Item:$index",
          style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      // 主轴上Item的尺寸
      maxCrossAxisExtent: 150.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 10.0,
      children: _buildTiles(100),
      // 滚动方向
      scrollDirection: Axis.vertical,
    );
  }
}

// 利用GridView.count创建网格视图
class GridViewCountBuilderDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(
      length,
      // 项目的索引
      (index) => Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          "Item:$index",
          style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 10.0,
      children: _buildTiles(100),
      // 滚动方向
      scrollDirection: Axis.vertical,
    );
  }
}

// 普通PageView的使用
class PageViewBuilderDame extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
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
            )),
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

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // 是否启用弹性效果，默认true
      pageSnapping: true,
      // 页面滚动方向
      scrollDirection: Axis.vertical,
      onPageChanged: (currentIndex) =>
          debugPrint("current page: $currentIndex"),
      controller: PageController(
        initialPage: 1,
        // 页面占用可视区域比例，默认1.0
        viewportFraction: 0.85,
      ),
      children: [
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "One",
            style: TextStyle(fontSize: 32.0, color: Colors.deepOrangeAccent),
          ),
        ),
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "Two",
            style: TextStyle(fontSize: 32.0, color: Colors.deepOrangeAccent),
          ),
        ),
        Container(
          color: Colors.deepOrange[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "Three",
            style: TextStyle(fontSize: 32.0, color: Colors.deepOrangeAccent),
          ),
        )
      ],
    );
  }
}
