import 'package:flutter/cupertino.dart';
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
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.local_activity, size: 128.0, color: Colors.black12),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.bike_scooter, size: 128.0, color: Colors.black12)
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Jesen.Mr", style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("kka@test.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.purple,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                  image: DecorationImage(
                    image: NetworkImage("https://resources.ninghao.net/images/childhood-in-a-picture.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.yellow[400]!.withOpacity(0.6),
                        BlendMode.hardLight
                    )
                  )
                ),
              ),
              ListTile(
                title: Text(
                  "Messages",
                  textAlign: TextAlign.right,
                ),
                // 在左边是leading,右边是trailing
                trailing: Icon(
                  Icons.message,
                  color: Colors.black26,
                  size: 24.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text(
                  "Favorite",
                  textAlign: TextAlign.right,
                ),
                // 在左边是leading,右边是trailing
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.black26,
                  size: 24.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text(
                  "Settings",
                  textAlign: TextAlign.right,
                ),
                // 在左边是leading,右边是trailing
                trailing: Icon(
                  Icons.settings,
                  color: Colors.black26,
                  size: 24.0,
                ),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
