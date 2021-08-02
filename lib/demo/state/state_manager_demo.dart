import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {

  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo>{
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      // father
      body: Counter(_count),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _count ++;
          });
        },
      ),
    );
  }
}

// son
class Counter extends StatelessWidget{

  final int count;

  Counter(this.count);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        label: Text('$count'),
      ),
    );
  }
}