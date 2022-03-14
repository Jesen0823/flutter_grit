import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo1UseFuture extends StatelessWidget {
  const StreamDemo1UseFuture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用Future创建Stream'),
        elevation: 0.0,
      ),
      body: StreamDemo1UseFutureHome(),
    );
  }
}

class StreamDemo1UseFutureHome extends StatefulWidget {
  const StreamDemo1UseFutureHome({Key? key}) : super(key: key);

  @override
  _StreamDemo1UseFutureHomeState createState() => _StreamDemo1UseFutureHomeState();
}

class _StreamDemo1UseFutureHomeState extends State<StreamDemo1UseFutureHome> {

  @override
  void initState() {
    super.initState();

    print('start create a stream.');
    Stream<String> _StreamDemo = Stream.fromFuture(fetchData());
    _StreamDemo.listen(onData);

    print('initialize completed..');
  }

  // 当stream有数据时的回调
  void onData(String data){
    print('onData：$data');
  }

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 5));
    return 'hello:';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("使用Future创建Stream并设置监听"),
      ),
    );
  }
}
