import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {

  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo>{
  int _count = 0;
  void _increaseCount(){
    setState(() {
      _count ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      // 爷爷
      body: CounterWrap(_count,_increaseCount),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );
  }
}

// 父亲
class CounterWrap extends StatelessWidget {

  final int count;
  final VoidCallback increaseCount;

  CounterWrap(this.count,this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(count,increaseCount),
    );
  }
}


// 儿子
class Counter extends StatelessWidget{

  final int count;
  final VoidCallback increaseCount;

  Counter(this.count,this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
    );
  }
}