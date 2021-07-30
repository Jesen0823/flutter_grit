import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          UseSizedBox(),
          UseAxisAlignment(),
        ],
      )
    );
  }
}

class UseSizedBox extends StatelessWidget{
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
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ),
      ],
    );
  }
}

// 主轴，交叉轴的使用
class UseAxisAlignment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      // 主轴位置
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // 交叉轴位置，与主轴垂直的轴
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconBadge(Icons.pool),
        IconBadge(Icons.umbrella,size: 48.0,),
        IconBadge(Icons.face),
      ],
    );
  }
}

// 自定义控件
class IconBadge extends StatelessWidget{
  final IconData icon;
  final double size;

  IconBadge(this.icon,{this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size+60,
        height: size+60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
