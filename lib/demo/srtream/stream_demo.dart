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

  @override
  void initState() {
    super.initState();

    print('start create a stream.');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('start listen stream.');
    _streamDemo.listen(_onData,onError: _onError,onDone: _onDone);
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

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 5));
    throw('error happen!');
    //return 'hello:';
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
