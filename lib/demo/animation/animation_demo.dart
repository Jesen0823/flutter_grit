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
  String _status = 'init';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      // 初始值
      value: 32.0,
      lowerBound: 32.0,
      // 设置最大最小值
      upperBound: 100.0,
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    _animationController.addListener(() {
      print('listener, value:${_animationController.value}');
      setState(() {
      });
    });

    _animationController.addStatusListener((status) {
      _status = status.toString();
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
    return Center(

      child: Column(
        children: [
          Text(_status,
            style: TextStyle(fontSize: 30.0),
          ),
          IconButton(
            icon: Icon(Icons.favorite,),
            iconSize: _animationController.value,
            onPressed: () {
              switch(_animationController.status){
                case AnimationStatus.completed:
                  _animationController.reverse();
                  break;
                default:
                  _animationController.forward();
              }
            },
          ),
        ],
      ),
    );
  }
}
