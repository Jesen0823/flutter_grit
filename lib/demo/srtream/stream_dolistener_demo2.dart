import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo2DoListener extends StatelessWidget {
  const StreamDemo2DoListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对Future创建的Stream监听做暂停/取消'),
        elevation: 0.0,
      ),
      body: StreamDemo2DoListenerHome(),
    );
  }
}

class StreamDemo2DoListenerHome extends StatefulWidget {
  const StreamDemo2DoListenerHome({Key? key}) : super(key: key);

  @override
  _StreamDemo2DoListenerHomeState createState() => _StreamDemo2DoListenerHomeState();
}

class _StreamDemo2DoListenerHomeState extends State<StreamDemo2DoListenerHome> {
 late StreamSubscription _streanDemoSubscription;

  @override
  void initState() {
    super.initState();

    print('start create a stream.');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    print('start listen stream.');
    _streanDemoSubscription
    = _streamDemo.listen(_onData,onError: _onError,onDone: _onDone);

    print('initialize completed..');
  }

  // 当stream有数据时的回调
  void _onData(String data){

    print('_onData：$data');
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
