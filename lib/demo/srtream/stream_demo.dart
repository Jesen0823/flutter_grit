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
    throw('error happen!');
    //return 'hello:';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
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
      ),
    );
  }
}
