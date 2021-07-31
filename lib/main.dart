import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/drawer_demo.dart';
import 'package:flutter_grit/demo/form_demo.dart';
import 'package:flutter_grit/demo/layout_demo.dart';
import 'package:flutter_grit/demo/view_dame.dart';
import 'package:flutter_grit/demo/navigator_demo.dart';
import 'demo/basic_explore_demo.dart';
import 'demo/bottom_navigator_bar.dart';
import 'demo/listview_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/sliver_demo.dart';
import 'model/post.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: Home(),

        //home: NavigatorDemo(),
        //initialRoute: '/',
        // 如果初始路由是下面定义的'/form'，则一打开就展示该页面
        initialRoute: '/form',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => SecondPage(title: 'About -route'),
          '/form':(context) => FormDemo(),
        },
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Color.fromRGBO(20, 180, 255, 1.0),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          /*leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigation",
            onPressed: () => debugPrint("click Navigation"),
          ),*/
          title: Text('NINGHAO'),
          actions: [
            IconButton(
              onPressed: () => debugPrint("click Search"),
              icon: Icon(Icons.search),
              tooltip: "Search",
            ),
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black45,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: [
              Tab(icon: Icon(Icons.local_activity)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.bike_scooter)),
              Tab(
                icon: Icon(Icons.view_quilt),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListViewDemo(),
            BasicExploreDemo(),
            //Icon(Icons.bike_scooter, size: 128.0, color: Colors.black12)
            LayoutDemo(),
            ViewDemo(),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigatorBarDemo(),
      ),
    );
  }
}
