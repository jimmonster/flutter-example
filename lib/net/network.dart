import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadNetWork extends StatelessWidget {
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
                return  /*new ListView(
                  children: <Widget>[
                    new Text("标题"+snapshot.data.title),
                    new Text("内容"+snapshot.data.body),
                  ],
                );
*/
                  new InitView(snapshot.data);
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
    var id = data.error_code.toString();
    var reason = data.reason;
    final info = data.result.getRange(4, 5).toString();

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[

          new Text("状态码:"+id,style: TextStyle(fontSize: 32.0,color: Colors.orange),),
          new Text("状态信息:"+reason,style: TextStyle(fontSize: 32.0,color: Colors.redAccent),),
          new Text("单条数据集合："+info,style: TextStyle(fontSize: 22.0,color: Colors.lightGreen),),
          new Text("所有数据集合："+data.result.toString(),style: TextStyle(color: Colors.blueGrey),),

        ],
      ),

    );
  }


}
final String urlPath="http://api.juheapi.com/japi/toh?key=8adb5f3b5ff1ff5631254bce266ab1b7&v=1.0&month=11&day=1";
//取出post请求
Future<Post> fetchPost() async {
  final response =
  await http.get(urlPath);
  final responseJson = json.decode(response.body);

  return new Post.fromJson(responseJson);
}
// bean
class Post {
  final int error_code;
  final String reason;
  final List result;


  Post({this.error_code, this.reason, this.result});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      error_code: json['error_code'],
      reason: json['reason'],
      result: json['result'],
    );
  }

}