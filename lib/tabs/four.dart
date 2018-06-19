import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class FourTab extends StatefulWidget {
  _FourTabTabState createState() => _FourTabTabState();
}

class _FourTabTabState extends State<FourTab> {
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
            builder: (context, response) {
              int length = response.data.data.length;

              if (response.hasData) {
                return new ListView.builder(
                    itemCount: length,
                    itemBuilder: (context, index) {
                      var src = response.data.data[index].cover.src;
                      var face = response.data.data[index].owner.face;
                      var name = response.data.data[index].owner.name;
                      var area = response.data.data[index].area;
                      var title = response.data.data[index].title;
                      int online = response.data.data[index].online;

                      double width =
                          response.data.data[index].cover.width.toDouble();
                      double height =
                          response.data.data[index].cover.height.toDouble();

                      return Container(
                        child: Center(
                          child: Column(

                            children: <Widget>[
                              new Image.network(src),
                              new Text("#"+area+"#"+title),

                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(name,style: TextStyle(color: Colors.black38)),
                                  Text(online>=10000? '${online/10000}万':'${online}')

                                ],
                              )
                            ],

                          ),

                        ),


                      );
                    });
              } else if (response.hasError) {
                return Text('获取数据失败${response.error}');
              } else {
                return CircularProgressIndicator();
              }

//              if(data.hasData){
//                print(data.data.data[0].toString());
//                return Text('获取到真实的数据'+data.data.data.toString());
//              }
//              else if(data.hasError){
//                return Text('数据获取失败${decode}');
//
//              }else {
//                return CircularProgressIndicator();
//              }
//
            }),
      ),
    );
  }
}



/// 加载网络数据
Future<BliBean> initData() async {
  String src = "http://api.live.bilibili.com//mobile/rooms?platform=android";
  var response = await http.get(src);
  print("获取的数据：" + response.body.toString());
  //解析数据
  return BliBean(response.body);
}

//真实数据解析

class BliBean {
  int code;
  String message;
  List<DataBean> data;

  BliBean(jsonStr) {
    var jsonRes = json.decode(jsonStr);

    code = jsonRes['code'];
    message = jsonRes['message'];
    data = [];

    for (var dataItem in jsonRes['data']) {
      data.add(new DataBean(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null ? '${json.encode(
        message)}' : 'null'},"data": $data}';
  }
}

class DataBean {
  int area_id;
  int area_v2_id;
  int area_v2_parent_id;
  int broadcast_type;
  int on_flag;
  int online;
  int room_id;
  int round_status;
  String accept_quality;
  String area;
  String area_v2_name;
  String area_v2_parent_name;
  String playurl;
  String title;
  CoverBean cover;
  OwnerBean owner;

  DataBean(jsonRes) {
    area_id = jsonRes['area_id'];
    area_v2_id = jsonRes['area_v2_id'];
    area_v2_parent_id = jsonRes['area_v2_parent_id'];
    broadcast_type = jsonRes['broadcast_type'];
    on_flag = jsonRes['on_flag'];
    online = jsonRes['online'];
    room_id = jsonRes['room_id'];
    round_status = jsonRes['round_status'];
    accept_quality = jsonRes['accept_quality'];
    area = jsonRes['area'];
    area_v2_name = jsonRes['area_v2_name'];
    area_v2_parent_name = jsonRes['area_v2_parent_name'];
    playurl = jsonRes['playurl'];
    title = jsonRes['title'];
    cover = new CoverBean(jsonRes['cover']);
    owner = new OwnerBean(jsonRes['owner']);
  }

  @override
  String toString() {
    return '{"area_id": ${area != null
        ? '${json.encode(area)}'
        : 'null'}_id,"area_v2_id": ${area != null
        ? '${json.encode(area)}'
        : 'null'}_v2_id,"area_v2_parent_id": ${area != null
        ? '${json.encode(area)}'
        : 'null'}_v2_parent_id,"broadcast_type": $broadcast_type,"on_flag": $on_flag,"online": $online,"room_id": $room_id,"round_status": $round_status,"accept_quality": ${accept_quality !=
        null ? '${json.encode(accept_quality)}' : 'null'},"area": ${area != null
        ? '${json.encode(area)}'
        : 'null'},"area_v2_name": ${area_v2_name != null
        ? '${json.encode(area_v2_name)}'
        : 'null'},"area_v2_parent_name": ${area_v2_parent_name != null ? '${json
        .encode(area_v2_parent_name)}' : 'null'},"playurl": ${playurl != null
        ? '${json.encode(playurl)}'
        : 'null'},"title": ${title != null
        ? '${json.encode(title)}'
        : 'null'},"cover": $cover,"owner": $owner}';
  }
}

class OwnerBean {
  int mid;
  String face;
  String name;

  OwnerBean(jsonRes) {
    mid = jsonRes['mid'];
    face = jsonRes['face'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"mid": $mid,"face": ${face != null
        ? '${json.encode(face)}'
        : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'}}';
  }
}

class CoverBean {
  int height;
  int width;
  String src;

  CoverBean(jsonRes) {
    height = jsonRes['height'];
    width = jsonRes['width'];
    src = jsonRes['src'];
  }

  @override
  String toString() {
    return '{"height": $height,"width": $width,"src": ${src != null ? '${json
        .encode(src)}' : 'null'}}';
  }
}
