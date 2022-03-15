import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'method.dart';

class LifeCycleDemo extends StatefulWidget {
  const LifeCycleDemo({Key? key}) : super(key: key);

  @override
  State<LifeCycleDemo> createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo> {
  bool isShowList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget的生命周期介绍'),
        actions: [
          BackButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        elevation: 2.0,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(8.0),
          child: Stack(
            children: [
              if (isShowList)
                ListView.builder(
                  itemCount: motheds.length,
                  itemBuilder: _itemBuilder,
                ) else Text('列表已经隐藏'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text('离开当前页面'),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isShowList = !isShowList;
          });
        },

      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Text(motheds[index].title,
                style: Theme.of(context).textTheme.headline6,),
            Text(motheds[index].description,
                style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.left,),
            SizedBox(height: 16.0),
            Divider(height: 1,color: Colors.black12,)
          ],
        )
      ],
    );
  }

  // 生命方法
  @override
  void initState() {
    super.initState();
    print('---initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('---didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('---deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('---dispose');
  }

  @override
  void didUpdateWidget(covariant LifeCycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('---didUpdateWidget');
  }
}
