import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadNetWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          //请求网络
          child: FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //获取到真实的数据
                return InitView(snapshot.data);
              } else if (snapshot.hasError) {
                //获取数据失败
                return Text("${snapshot.error}");
              }

              // 默认显示进度条
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
var index=0;
class InitView extends StatelessWidget {
  //通过构造方法获取到传递过来的数据
  Post data;

  InitView(this.data);

  @override
  Widget build(BuildContext context) {
    var id = data.error_code.toString();
    var reason = data.reason;
    List<dynamic> info = data.result;


    var _isflag=true;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          color: Colors.lightGreenAccent,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    info[index]['title'],
                  ),
                  Text(info[index]['des']),
                  new Image.network(
                    info[index]['pic'],
                    height: 200.0,
                  )
                ],
              ),

//              IconButton(
//                 icon: (_isflag ? new Icon(Icons.add_circle_outline)
//                  : new Icon(Icons.add_circle)),
//                  color: Colors.red[500],
//                  onPressed: _num()),


              new FloatingActionButton(onPressed: _addNum())

            ],
          ),
        ));
  }


}

_addNum() {
  print("index:"+index.toString());
  index++;
  Notification;
}

final String urlPath =
    "http://api.juheapi.com/japi/toh?key=8adb5f3b5ff1ff5631254bce266ab1b7&v=1.0&month=11&day=1";
//取出post请求
Future<Post> fetchPost() async {
  final response = await http.get(urlPath);
  final responseJson = json.decode(response.body);

  return Post.fromJson(responseJson);
}

// bean
class Post {
  final int error_code;
  final String reason;
  final List result;

  Post({this.error_code, this.reason, this.result});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      error_code: json['error_code'],
      reason: json['reason'],
      result: json['result'],
    );
  }
}
