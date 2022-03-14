import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo4Sink extends StatelessWidget {
  const StreamDemo4Sink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用Sink添加数据到Stream'),
        elevation: 0.0,
      ),
      body: StreamDemo4SinkHome(),
    );
  }
}

class StreamDemo4SinkHome extends StatefulWidget {
  const StreamDemo4SinkHome({Key? key}) : super(key: key);

  @override
  _StreamDemo4SinkHomeState createState() => _StreamDemo4SinkHomeState();
}

class _StreamDemo4SinkHomeState extends State<StreamDemo4SinkHome> {
 late StreamSubscription _streanDemoSubscription;
 late StreamController<String> _streamController;
 late StreamSink _streamSink;

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
    _streamController = StreamController<String>();

    print('start listen stream.');

    _streamController.stream.listen(_onData_2,onError: _onError,onDone: _onDone);

    _streamSink = _streamController.sink;
    print('initialize completed..');
  }

  void _onData_2(String data){

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
