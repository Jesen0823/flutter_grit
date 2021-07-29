import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}