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

class _AnimationDemoHomeState extends State<AnimationDemoHome> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
