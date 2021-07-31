/*
* 表单相关
* */

import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: ThemeDemo(),

      // 自定义主题，覆盖全局主题
      /*body: Theme(
        data: ThemeData(
          primaryColor: Colors.green,
        ),
        child: ThemeDemo(),
      ),*/
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.green,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldDemo(),
            ],
          ),
        ),
      ),

      // 覆盖的时候，除了指定的primaryColor属性被覆盖，其他的仍保留全局
      /*body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.blueGrey,
        ),
        child: ThemeDemo(),
      ),*/
    );
  }
}

// 表单 TextField
class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}


// 自定义主题
class ThemeDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      // main.dart定义的使用全局主题
      // 该色彩就是main.dart定义的primarySwatch
      color: Theme.of(context).primaryColor,
      // 使用另外一种全局色彩
      //color: Theme.of(context).accentColor,
    );
  }
}
