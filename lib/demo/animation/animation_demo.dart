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

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin{
  late AnimationController _animationController;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this,
    );
    
    _animationController.addListener(() {
      print('listener, value:${_animationController.value}');
    });
    // 开启动画
    _animationController.forward();
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
