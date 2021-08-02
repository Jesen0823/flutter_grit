import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({Key? key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                    label: Text('Life'),
                ),
                SizedBox(width: 4.0,),
                Chip(
                  label: Text('Flower'),
                  backgroundColor: Colors.orange,
                ),
                SizedBox(width: 4.0,),
                Chip(
                  label: Text('Apple'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Text('周'),
                  ),
                ),
                SizedBox(width: 4.0,),
                Chip(
                  label: Text('Shanghai'),
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage("assets/advert_2.jpg"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
