import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: null,
                child: Text('Home'),
            ),
            TextButton(
              onPressed: (){
               Navigator.pushNamed(context, '/about');
              },
              child: Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  final String title;

  SecondPage({
     required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.5,
        actions: [
          BackButton(color: Colors.blue,onPressed: (){
            Navigator.pop(context);
          },)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}
