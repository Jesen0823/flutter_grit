import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/srtream/stream_broadcast_demo5.dart';
import 'package:flutter_grit/demo/srtream/stream_demo6.dart';
import 'package:flutter_grit/demo/srtream/stream_dolistener_demo2.dart';
import 'package:flutter_grit/demo/srtream/stream_sink_demo4.dart';
import 'package:flutter_grit/demo/srtream/stream_streamcontrol_demo3.dart';
import 'package:flutter_grit/demo/srtream/stream_use_future_demo1.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("stream 案例"),
          ElevatedButton(
            onPressed: () {
              StreamDemo1UseFuture();
            },
            child: Text('Future创建Stream'),
          ),
          ElevatedButton(
            onPressed: () {
              StreamDemo2DoListener();
            },
            child: Text('Future创建Stream设置监听'),
          ),
          ElevatedButton(
            onPressed: () {
              StreamDemo3Control();
            },
            child: Text('使用StreamControl创建Stream并设置监听'),
          ),
          ElevatedButton(
            onPressed: () {
              StreamDemo4Sink();
            },
            child: Text('使用sink给Stream添加监听'),
          ),
          ElevatedButton(
            onPressed: () {
              StreamDemo5BroadCast();
            },
            child: Text('使用BroadCast创建Stream设置多个订阅'),
          ),
          ElevatedButton(
            onPressed: () {
              StreamDemo6();
            },
            child: Text('使用stream的数据创建widget'),
          ),
        ],
      ),
    );
  }
}
