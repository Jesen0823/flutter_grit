import 'package:flutter/material.dart';

class BlocDemo extends StatelessWidget {
  const BlocDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc 的使用'),),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text(''),
              onTap: (){
                Navigator.pushNamed(context, '');
              },
            )
          ],

        ),
      ),
    );
  }
}
