import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        // 爷爷
        body: CounterWrap(),
        // 第二个参数_ 是指小部件，可选参数
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          // floatingActionButton不需要重建
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        ),
      ),
    );
  }
}

// 父亲
class CounterWrap extends StatelessWidget {
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

    return ScopedModelDescendant<CounterModel>(
      builder: (context,_,model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
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

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    // 该监听用来监听小部件以便重建小部件
    notifyListeners();
  }
}
