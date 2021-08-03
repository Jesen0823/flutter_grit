import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/state/state_manager_demo.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: ActionChip(
        label: Text('0'),
        onPressed: (){
          _counterBloc.log();
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
        },
    );
  }
}

class CounterBloc{
  void log(){
    print('bloc');
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