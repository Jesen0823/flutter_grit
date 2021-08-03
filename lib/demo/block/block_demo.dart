import 'package:flutter/material.dart';

import 'counter_block.dart';

/// BLOCK架构
class BlockDemo extends StatelessWidget {
  const BlockDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlockDemo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}



