import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 对它的子部件添加限制，如最小最大
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 200.0,
            maxWidth: 200.0,
          ),
          child: Container(
            color: Color.fromRGBO(100, 26, 100, 1.0),
          ),
        ),
      ],
    ));
  }
}

// AspectRatio指定宽高比
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Container(
        color: Color.fromRGBO(100, 26, 255, 1.0),
      ),
    );
  }
}

// Stack类似FrameLayout
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            UseSizedBox(),
            UseAxisAlignment(),
          ],
        )
      ],
    );
  }
}

class UseSizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox 如果不设置大小，默认是它包裹内容的大小,常用来做间隔
        SizedBox(
          width: 80.0,
          height: 120.0,
          child: Container(
            // child的位置，还可以取值 Alignment.topCenter/topLeft等等
            alignment: Alignment(0.0, -0.8),

            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              Icons.add_location_alt_sharp,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ),
        // 此处用作间隔
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: 100.0,
          height: 80.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(40, 100, 90, 1.0),
              //borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(7, 102, 200, 1.0),
                  Color.fromRGBO(3, 54, 255, 0.5),
                ],
              ),
            ),
            child: Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ),
        Positioned(
          child: Icon(
            Icons.star,
            size: 10.0,
            color: Colors.white,
          ),
          right: 20.0,
          top: 20.0,
        ),
        Positioned(
          child: Icon(
            Icons.star,
            size: 10.0,
            color: Colors.white,
          ),
          right: 10.0,
          top: 8.0,
        ),
        Positioned(
          child: Icon(
            Icons.star,
            size: 10.0,
            color: Colors.white,
          ),
          right: 19.0,
          top: 12.0,
        ),
      ],
    );
  }
}

// 主轴，交叉轴的使用
class UseAxisAlignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // 主轴位置
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // 交叉轴位置，与主轴垂直的轴
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconBadge(Icons.pool),
        IconBadge(
          Icons.umbrella,
          size: 48.0,
        ),
        IconBadge(Icons.face),
      ],
    );
  }
}

// 自定义控件
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
