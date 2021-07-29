import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicExploreDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100]!.withOpacity(0.4),
      child: Column(
        children: [
          Container(
            child: Icon(Icons.pool, size:32.0, color: Colors.white,),
            color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
          ),
          RichTextDemo(),
          TextDemo(),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(
          text: '卡卡西',
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100,
          ),
          children: [
            TextSpan(
                text: 'kakaxi',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurpleAccent,
                )
            )
          ]
      ),
    );
  }
}

class TextDemo extends StatelessWidget{
  final _textStyle = TextStyle(fontSize: 16.0);
  final String _author = "毛姆";
  final String _title = "人性的枷锁";
  final String _context =
      "菲利普跟在莎莉的后面，穿过一行行蛇麻草。他对这儿的切毫不感到陌生，就好像回到了自己的家 里一般。此时，阳光明亮，人影投地，轮廓鲜明。菲利普目不转睛欣赏着茂盛的绿叶。蛇麻草渐渐变黄了，在他看来，它们中间蕴蓄着美和激情，正如西西里的诗人 们在紫红色的葡萄里所发现的一样。他们俩并肩朝前走着，菲利普觉得自己完全为周围万物茂盛、欣欣向荣的景象所陶醉。";

  @override
  Widget build(BuildContext context) {
    return   Text(
      "《$_title》 ---$_author \n  $_context",
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
    );
  }
}