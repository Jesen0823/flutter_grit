import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo6 extends StatelessWidget {
  const StreamDemo6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo6'),
        elevation: 0.0,
      ),
      body: StreamDemo6Home(),
    );
  }
}

class StreamDemo6Home extends StatefulWidget {
  const StreamDemo6Home({Key? key}) : super(key: key);

  @override
  _StreamDemo6HomeState createState() => _StreamDemo6HomeState();
}

class _StreamDemo6HomeState extends State<StreamDemo6Home> {
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

  void _addDataToStream() async {
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
    //Stream<String> _StreamDemo6 = Stream.fromFuture(fetchData());
    print('start listen stream.');
    /*_streanDemoSubscription
    = _StreamDemo6.listen(_onData,onError: _onError,onDone: _onDone);*/
    _streanDemoSubscription = _streamController.stream
        .listen(_onData, onError: _onError, onDone: _onDone);

    _streamController.stream
        .listen(_onData_2, onError: _onError, onDone: _onDone);

    _streamSink = _streamController.sink;
    print('initialize completed..');
  }

  // 当stream有数据时的回调
  void _onData(String data) {
    setState(() {
      _result1 = data;
    });
    print('_onData：$data');
  }

  void _onData_2(String data) {
    setState(() {
      _result2 = data;
    });
    print('_onData_2:$data');
  }

  void _onError(error) {
    print('_onError:$error');
  }

  void _onDone() {
    print('Done!');
  }

  void _pauseStream() {
    print('Pause subscription');
    _streanDemoSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    _streanDemoSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel subscription');
    _streanDemoSubscription.cancel();
  }

  Future<String> fetchData() async {
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
            //Text('$_result1 : $_result2'),
            StreamBuilder(
                stream: _streamController.stream,
                initialData: '...',
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                }),
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
