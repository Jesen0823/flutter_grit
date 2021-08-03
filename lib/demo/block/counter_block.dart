import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/state/state_manager_demo.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot){
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: (){
              _counterBloc.log();
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  const CounterActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
        onPressed: (){
          _counterBloc.log();
          _counterBloc.counter.add(1);
        },
    );
  }

}

class CounterBloc{
  int _count = 0;
  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;
  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  void log(){
    print('bloc');
  }

  CounterBloc(){
    _counterActionController.stream.listen((event) {
      print('CounterBloc: $event');
      _count = event +_count;
      _counterController.add(_count);
    });
  }

  void dispose(){
    _counterActionController.close();
    _counterController.close();
  }
}

class CounterProvider extends InheritedWidget {
  final CounterBloc bloc;
  final Widget child;

  CounterProvider({
   required this.child,
   required this.bloc,
}):super(child: child);

  static CounterProvider of(BuildContext context) {
    final CounterProvider? result = context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    assert(result != null, 'No CounterProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}