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
  late Animation _animation;
  late Animation _colorAnimation;
  late CurvedAnimation _curvedAnim;
  String _status = 'init';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      // 注释掉，因为用animation和Tween了
      // 初始值
      //value: 32.0,
      //lowerBound: 32.0,
      // 设置最大最小值
      //upperBound: 100.0,
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    _curvedAnim = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
    );
    /*_animation = Tween(begin: 32.0, end: 100.0).animate(_animationController);
    _colorAnimation = ColorTween(begin:Colors.blue, end:Colors.purple)
        .animate(_animationController);*/
    _animation = Tween(begin: 32.0, end: 100.0).animate(_curvedAnim);
    _colorAnimation = ColorTween(begin:Colors.blue, end:Colors.purple)
        .animate(_curvedAnim);

    /*_animationController.addListener(() {
      print('listener, value:${_animationController.value}');
      setState(() {
      });
    });*/

    _animationController.addStatusListener((status) {
      _status = status.toString();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        children: [
          Text(_status,
            style: TextStyle(fontSize: 30.0),
          ),
          AnimatedHeart(
              animations: [
                _animation,
                _colorAnimation,
              ],
              controller: _animationController,
          ),
        ],
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget{
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    required this.animations,
    required this.controller
}) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite,),
      iconSize: animations[0].value as double,
      color: animations[1].value!,
      onPressed: () {
        switch(controller.status){
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}