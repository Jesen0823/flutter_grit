import 'package:bloc_use_demo/bloc_use_demo.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(BlicDemoCp());
}

class BlicDemoCp extends StatelessWidget {
  const BlicDemoCp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 在组件component中定义的bloc demo
    return buildComponentBlocDemo();
  }
}
