// 详情页布局

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grit/model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;

  PostShow({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Image.network(post.imageUrl),
          Container(
            padding: EdgeInsets.all(32.0),
            // 占满所有可用宽度
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${post.title}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '${post.author}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                // 分割空白
                SizedBox(
                  height: 32.0,
                ),
                Text(
                  '${post.description}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
