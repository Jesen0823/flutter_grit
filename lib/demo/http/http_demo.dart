import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'joke_entity.dart';

class HttpDemo extends StatelessWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  const HttpDemoHome({Key? key}) : super(key: key);


  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {


  @override
  void initState() {
    super.initState();
    //fetchPosts().then((value) => print(value));

    //test();
  }

  /*void test() {
    final post = {
      'title': 'hello',
      'description': 'nice Theme.of(context)',
    };
    print(post['title']);

    final postJson = json.encode(post);
    print(postJson);
    final postJsonConverted = json.decode(postJson);
    print('the type of postJsonConverted: ${postJsonConverted is Map}');
    final postModel = Post.fromJson(postJsonConverted);
    print('dart bean: ${postModel.title}');
    print('dart json:${json.encode(postModel)}');
  }*/

  Future<List<JokeShowapiResBodyContentlist>?> fetchPosts() async {
    /*final response = await http
        .get(Uri.parse('https://resources.ninghao.net/demo/posts.json'));*/
    final response = await http
        .get(Uri.parse('http://route.showapi.com/341-2?showapi_appid=933775&page=1&maxResult=30&showapi_sign=ff8e0e3b0b614f769c52af8378feabd5'));

    print('statusCode: ${response.statusCode}');
    print('body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      JokeEntity entity = JokeEntity.fromJson(responseBody);
      List<JokeShowapiResBodyContentlist>? contents = entity.showapiResBody?.contentlist;

      //List<TuchongPicsFeedList> feedList = responseBody['feedList'] =>
          /*.map<TuchongPicsFeedListImages>((item) => Post.fromJson(item))
          .toList();*/
      return contents;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('data FutureBuilder: ${snapshot.data}');
        print('connectionState :${snapshot.connectionState}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading..'),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((item) {
            /*return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );*/
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.ct),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.img),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

/*
class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  );

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'author': author,
        'imageUrl': imageUrl,
      };
}
*/
