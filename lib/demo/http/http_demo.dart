import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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

  void test(){
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
  }

  Future<List<Post>> fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://resources.ninghao.net/demo/posts.json'));
    print('statusCode: ${response.statusCode}');
    print('body: ${response.body}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

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
