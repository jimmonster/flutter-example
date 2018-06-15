import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_net/net/url/UrlPath.dart';
import 'package:http/http.dart' as http;

class FiveTab extends StatefulWidget {

    _FiveTabState createState() => _FiveTabState();

}

class _FiveTabState extends State<FiveTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B站视频'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: new FutureBuilder<BliBean>(
            future: initData(),
            builder: (context, data) {

              if(data.hasData){
                print(data.data.data[0].toString());
                return Text('获取到真实的数据'+data.data.data[0]);
              }
              else if(data.hasError){
                return Text('数据获取失败');

              }else {
                return CircularProgressIndicator();
              }




        }),
      ),
    );
  }
}

/// 加载网络数据
Future<BliBean> initData() async {
  String  src =
  "http://api.live.bilibili.com//mobile/rooms?platform=android";

  var response = await http.get(src);
  print("获取的数据：" + response.body.toString());
  Map decode = json.decode(response.body);

  //解析数据
  return BliBean.forjson(decode);
}

class BliBean {
  String code;
  String message;
  List data;


  BliBean({this.code, this.message, this.data});

  factory BliBean.forjson(Map<String, dynamic> decode) {

    return BliBean(
        code:decode['code'],
        message:decode['message'],
        data:decode['data'],
    );
  }
}
