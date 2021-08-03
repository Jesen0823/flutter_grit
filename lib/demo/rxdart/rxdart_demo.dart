import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

/// rxDart的使用
/// * Observables 继承了Stream,添加了Stream没有的功能
/// * 其次
/// *按到
class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  const RxDartDemoHome({Key? key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  late PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject.where((event) => event.length > 3) // 添加条件
        .listen((value) {
      print('_textFieldSubject：$value');
    });

    // PublishSubject<String> _subject = PublishSubject<String>();
    BehaviorSubject<String> _subject = BehaviorSubject<String>();

    _subject.listen((data) => print('listen 1:$data'));
    _subject.add('nmb');
    _subject.listen((data) => print('listen 2:${data.toUpperCase()}'));
    _subject.add('too');
    _subject.close();

    ReplaySubject<String> _subjectReplay = ReplaySubject<String>(maxSize: 2);
    _subjectReplay.add('1000');
    _subjectReplay.add('1001');
    _subjectReplay.add('1002');
    _subjectReplay.listen((data) => print('_subjectReplay listen 1:$data'));
    _subjectReplay.listen(
        (data) => print('l_subjectReplay isten 2:${data.toUpperCase()}'));
    _subjectReplay.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input:$value');
        },
        onSubmitted: (vaue) {
          _textFieldSubject.add('submit:$vaue');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }
}
