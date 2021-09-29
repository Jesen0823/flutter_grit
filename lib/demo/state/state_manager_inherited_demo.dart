import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/// inherited状态管理


class StateManagementDemo2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _StateManagementDemo2State();
}

class _StateManagementDemo2State extends State<StateManagementDemo2>{
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
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo,inherited'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.red,),
          onPressed: _increaseCount,
        ),
      ),
    );
  }

}

// 父亲
class CounterWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

// 儿子
class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // 从 CounterProvider 得到数据
    final int count = CounterProvider.of(context)!.count;
    final VoidCallback increaseCount = CounterProvider.of(context)!.increaseCount;

    return ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
    );
  }
}

// 中介，不通过爸爸，爷爷领养了个孙子
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    required this.count,
    required this.increaseCount,
    required this.child,
  }) : super(child: child);

  static CounterProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

