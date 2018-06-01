import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_net/net/url/UrlPath.dart';
import 'package:http/http.dart' as http;


//界面布局
class FirstTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder<Post>(
            //请求未来加载的数据
              future: initData(),
              //请求到的数据做处理
              builder: (context, responceData) {
                if (responceData.hasData) {
                  //请求到真实的数据
                  return ListView(
                    children: <Widget>[
                      Text(
                          responceData.data.result.toString()
                      ),
                    ],

                  );
                } else if (responceData.hasError) {
                  return Text("数据接收失败：" + "${responceData.error}");
                } else {
                  return CircularProgressIndicator();
                }
              }),

        )


    );
  }
}
//请求接口
//final String urlPath = "http://api.juheapi.com/japi/toh?key=8adb5f3b5ff1ff5631254bce266ab1b7&v=1.0&month=11&day=1";
final String urlPath = UrlPath.FIRSTURL;
//网络请求
Future<Post> initData() async {
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