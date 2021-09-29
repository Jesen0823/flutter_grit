import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  const StreamDemoHome({Key? key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
 late StreamSubscription _streanDemoSubscription;
 late StreamController<String> _streamController;
 late StreamSink _streamSink;
 String _result1 = '?';
 String _result2 = '?';

 @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void _addDataToStream() async{
    print('add Data to stream');
    String data = await fetchData();
    // 使用Controller添加数据
    //_streamController.add(data);
    // 使用sink添加数据
    _streamSink.add(data);
  }

  @override
  void initState() {
    super.initState();

    print('start create a stream.');
    // 普通Controller只能添加一个订阅
    //_streamController = StreamController<String>();
    // 可以添加多个订阅的controller
    _streamController = StreamController.broadcast();
    //Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('start listen stream.');
    /*_streanDemoSubscription
    = _streamDemo.listen(_onData,onError: _onError,onDone: _onDone);*/
    _streanDemoSubscription
    = _streamController.stream.listen(_onData,onError: _onError,onDone: _onDone);

    _streamController.stream.listen(_onData_2,onError: _onError,onDone: _onDone);

    _streamSink = _streamController.sink;
    print('initialize completed..');
  }

  // 当stream有数据时的回调
  void _onData(String data){
    setState(() {
      _result1 = data;
    });
    print('_onData：$data');
  }

  void _onData_2(String data){
   setState(() {
     _result2 = data;
   });
   print('_onData_2:$data');
  }

  void _onError(error){
    print('_onError:$error');
  }

  void _onDone(){
    print('Done!');
  }

  void _pauseStream(){
    print('Pause subscription');
    _streanDemoSubscription.pause();
  }
 void _resumeStream(){
   print('Resume subscription');
   _streanDemoSubscription.resume();
 }
 void _cancelStream(){
   print('Cancel subscription');
   _streanDemoSubscription.cancel();
 }

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 10));
    //throw('error happen!');
    return 'hello:';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_result1 : $_result2'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _pauseStream,
                  child: Text('pause'),
                ),
                ElevatedButton(
                  onPressed: _resumeStream,
                  child: Text('Resume'),
                ),
                ElevatedButton(
                  onPressed: _cancelStream,
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _addDataToStream,
                  child: Text('Add to Controller'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
