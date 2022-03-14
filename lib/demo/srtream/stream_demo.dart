import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grit/demo/srtream/stream_broadcast_demo5.dart';
import 'package:flutter_grit/demo/srtream/stream_demo6.dart';
import 'package:flutter_grit/demo/srtream/stream_dolistener_demo2.dart';
import 'package:flutter_grit/demo/srtream/stream_sink_demo4.dart';
import 'package:flutter_grit/demo/srtream/stream_streamcontrol_demo3.dart';
import 'package:flutter_grit/demo/srtream/stream_use_future_demo1.dart';

import '../material_components.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('stream 案例')),
      body: ListView(
        children: [
          ListItem(
            title: 'Future创建Stream',
            page: StreamDemo1UseFuture(),
          ),
          ListItem(
            title: 'Future创建Stream设置监听',
            page: StreamDemo2DoListener(),
          ),
          ListItem(
            title: '使用StreamControl创建Stream并设置监听',
            page: StreamDemo3Control(),
          ),
          ListItem(
            title: '使用sink给Stream添加监听',
            page: StreamDemo4Sink(),
          ),
          ListItem(
            title: '使用BroadCast创建Stream设置多个订阅',
            page: StreamDemo5BroadCast(),
          ),
          ListItem(
            title: '使用stream的数据创建widget',
            page: StreamDemo6(),
          ),
        ],
      ),
    );
  }
}
