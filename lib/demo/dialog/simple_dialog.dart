import 'package:flutter/material.dart';

enum Option { Positive, Negative }

class SimpleDialogDemo extends StatefulWidget {
  const SimpleDialogDemo({Key? key}) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';

  Future _openSimpleDialog() async {
    // 使用await,async是为了得到Dialog选取结果
    final selectResult = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('SimpleDialog'),
          children: [
            SimpleDialogOption(
              child: Text('这是一个简单对话框'),
            ),
            SimpleDialogOption(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context, Option.Negative);
              },
            ),
            SimpleDialogOption(
              child: Text('确定'),
              onPressed: () {
                Navigator.pop(context, Option.Positive);
              },
            ),
          ],
        );
      },
    );
    switch (selectResult) {
      case Option.Positive:
        setState(() {
          _choice = '确定了';
        });
        break;
      case Option.Negative:
        setState(() {
          _choice = '取消了';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_choice'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}
