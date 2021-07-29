import 'package:flutter/material.dart';
import 'demo/listview_demo.dart';
import 'model/post.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.yellow
      )
    );
  }
}

class Home extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigation",
            onPressed: () => debugPrint("click Navigation"),
          ),
          title: Text('NINGHAO'),
          actions: [
            IconButton(
                onPressed:() => debugPrint("click Search"),
                icon: Icon(Icons.search),
              tooltip: "Search",
            ),
          ],
          elevation: 0.0,
        ),
        body: null
      );
    }
}


