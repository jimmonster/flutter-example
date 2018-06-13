import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_net/net/url/UrlPath.dart';
import 'package:http/http.dart' as http;

//界面布局
class FirstTab extends StatefulWidget {
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('布局样式'),
          backgroundColor: Colors.lightGreenAccent,
          centerTitle: true,
        ),
        body: new Container(
            child: new Center(
          child: new FutureBuilder<Bean>(
              //加载数据
              future: initData(),
              //处理数据
              builder: (context, responsedata) {
                if (responsedata.hasData) {
                  var data = responsedata.data.result;
                  return _View(data);
                } else if (responsedata.hasError) {
                  return Text('获取数据失败：' + "${responsedata.error}");
                } else {
                  return new CircularProgressIndicator();
                }
              }),
        )));
  }

  /**
   * 加载网络数据
   */
  Future<Bean> initData() async {
    var response = await http.get(UrlPath.FIRSTURL);
    print("获取的数据：" + response.body.toString());
    Map decode = json.decode(response.body);

    //解析数据
    return Bean.forjson(decode);
  }

  int index = 0;

  Widget _View(List data) {
    _addNum() {
      setState(() {
        index++;
      });
    }

    return new ListView(
      children: <Widget>[
        Text(data[index]['title']),
        Text(data[index]['des']),
        new Image.network(
          data[index]['pic'],
          height: 400.0,
        ),

        Text(
          '当前页数：' + '${index}',
          textDirection: TextDirection.rtl,
        ),

        //点击事件更新
        new FloatingActionButton(
            child: Text('下一页'),
            tooltip: '下一页',
            onPressed: _addNum,
            backgroundColor: Colors.deepOrangeAccent),
      ],
    );
  }
}

class Bean {
  final int error_code;
  final String reason;
  final List result;

  Bean({this.error_code, this.reason, this.result});

  factory Bean.forjson(Map<String, dynamic> json) {
    //将解析完成的数据返回
    return Bean(
      error_code: json['error_code'],
      reason: json['reason'],
      result: json['result'],
    );
  }
}
