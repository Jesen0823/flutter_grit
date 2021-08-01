import 'package:flutter/material.dart';

class PopupMenuDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuDemo'),
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
                PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: 'Home',
                      child: Text('Home'),
                    ),
                    PopupMenuItem(
                      value: 'Test',
                      child: Text('Test'),
                    ),
                    PopupMenuItem(
                      value: 'nmb',
                      child: Text('nmb'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
