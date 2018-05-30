import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fetch Data Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Fetch Data Example'),
        ),
        body: new Center(
          //请求网络
          child: new FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context,snapshot) {


              if (snapshot.hasData) {
                //获取到真实的数据
              return  new ListView(
                  children: <Widget>[
                    new Text("标题"+snapshot.data.title),
                    new Text("内容"+snapshot.data.body),
                  ],
                );

                // new InitView(snapshot.data);
              } else if (snapshot.hasError) {
                //获取数据失败
                return new Text("${snapshot.error}");
              }

              // 默认显示进度条
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

}

class InitView  extends StatelessWidget{
  //通过构造方法获取到传递过来的数据
  Post data;
  InitView(this.data);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.cyan,
      body: new ListView(
        children: <Widget>[

          new Text("标题"+data.title),
          new Text("内容"+data.body),
        ],
      ),

    );
  }


}
//取出post请求
Future<Post> fetchPost() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);

  return new Post.fromJson(responseJson);
}
//post bean
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}