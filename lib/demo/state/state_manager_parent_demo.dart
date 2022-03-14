import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/// 状态传递，由父Widget一级一级向下传递，
/// 在构造方法中传递，比较繁琐混乱


class StateManagementByParentDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _StateManagementByParentDemoState();
}

class _StateManagementByParentDemoState extends State<StateManagementByParentDemo>{
  int _count = 0;

  // 给子Widget用的回调
  void _increaseCount(){
    setState(() {
      _count +=1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo,由父到子Widget一级级传递'),
        elevation: 0.0,
      ),
      body: CounterWrapper(_count, _increaseCount),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.red,),
        onPressed: _increaseCount,
      ),
    );
  }

}

// 父亲
class CounterWrapper extends StatelessWidget {

  final int count;
  final VoidCallback increaseCount;

  CounterWrapper(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(count,increaseCount),
    );
  }
}

// 儿子
class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {

    return ActionChip(
        label: Text('${count}'),
        onPressed: increaseCount,
    );
  }
}
