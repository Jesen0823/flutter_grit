import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  const AnimationDemoHome({Key? key}) : super(key: key);

  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      // 初始值
      value: 32.0,
      lowerBound: 0.0,
      // 设置最大最小值
      upperBound: 100.0,
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    _animationController.addListener(() {
      print('listener, value:${_animationController.value}');
      setState(() {});
    });
    // 开启动画
    //_animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('${_animationController.value}'),
      onPressed: () {
        _animationController.forward();
      },
    );
  }
}
