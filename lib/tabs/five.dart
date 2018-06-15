import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class FiveTab extends StatefulWidget {

    _FiveTabState createState() => _FiveTabState();

}

class _FiveTabState extends State<FiveTab> {
 int index=0;

 _addNum(){
   setState(() {
     index++;
   });

 }
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
              return ListView(
                children: <Widget>[
                  new Image.network(response.data.data[index].cover.src),
                  new Image.network(response.data.data[index].owner.face),
                  new MaterialButton(

                      child: Text('下一张'),
                      onPressed: _addNum,
                    color: Colors.pinkAccent,


                  ),


                ],
              );

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
var body;

/// 加载网络数据
Future<BliBean> initData() async {
  String  src =
  "http://api.live.bilibili.com//mobile/rooms?platform=android";

  var response = await http.get(src);
  body = response.body.toString();
  print("获取的数据：" + response.body.toString());
  //解析数据
  return BliBean(response.body);
}

//class BliBean {
//   int code;
//  String message;
//  List<DataBean> data;
//
//
//  BliBean({this.code, this.message, this.data});
//
//
//  factory BliBean.forjson(Map json) {
//
//    return BliBean(
//        code: json['code'],
//        message: json['message'],
//        data: json['data'],
//    );
//  }
//}
//
//class DataBean {
//   OwnerBean owner;
//   CoverBean cover;
//   String title;
//   int room_id;
//   int online;
//   String playurl;
//   String accept_quality;
//   int broadcast_type;
//   String area;
//   int area_id;
//   int on_flag;
//   int round_status;
//   int area_v2_id;
//   String area_v2_name;
//   int area_v2_parent_id;
//   String area_v2_parent_name;
//
//   DataBean({this.owner, this.cover, this.title, this.room_id, this.online,
//       this.playurl, this.accept_quality, this.broadcast_type, this.area,
//       this.area_id, this.on_flag, this.round_status, this.area_v2_id,
//       this.area_v2_name, this.area_v2_parent_id, this.area_v2_parent_name});
//
//   factory DataBean.forjson(Map json){
//     return DataBean(
//       owner:json['owner'],
//       cover:json['cover'],
//       title:json['title'],
//       room_id:json['room_id'],
//       online:json['online'],
//       playurl:json['playurl'],
//       accept_quality:json['accept_quality'],
//       broadcast_type:json['broadcast_type'],
//       area:json['area'],
//       area_id:json['area_id'],
//       on_flag:json['on_flag'],
//       round_status:json['round_status'],
//       area_v2_id:json['area_v2_id'],
//       area_v2_name:json['area_v2_name'],
//       area_v2_parent_id:json['area_v2_parent_id'],
//       area_v2_parent_name:json['area_v2_parent_name'],
//
//     );
//   }
//
//}
//
//class CoverBean {
//
//   String src;
//   int height;
//   int width;
//
//   CoverBean({this.src, this.height, this.width});
//   factory CoverBean.forjson(Map json){
//     return CoverBean(
//       src:json['src'],
//       height:json['height'],
//       width:json['width'],
//
//     );
//   }
//
//
//}
//
//class OwnerBean {
//   String face;
//   int mid;
//   String name;
//
//   OwnerBean({this.face, this.mid, this.name});
//
//   factory OwnerBean.forjson(Map json){
//     return OwnerBean(
//       face:json['face'],
//       mid:json['mid'],
//       name:json['name'],
//
//     );
//   }

//}


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

    for (var dataItem in jsonRes['data']){

      data.add(new DataBean(dataItem));
    }


  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null?'${json.encode(message)}':'null'},"data": $data}';
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
    return '{"area_id": ${area != null?'${json.encode(area)}':'null'}_id,"area_v2_id": ${area != null?'${json.encode(area)}':'null'}_v2_id,"area_v2_parent_id": ${area != null?'${json.encode(area)}':'null'}_v2_parent_id,"broadcast_type": $broadcast_type,"on_flag": $on_flag,"online": $online,"room_id": $room_id,"round_status": $round_status,"accept_quality": ${accept_quality != null?'${json.encode(accept_quality)}':'null'},"area": ${area != null?'${json.encode(area)}':'null'},"area_v2_name": ${area_v2_name != null?'${json.encode(area_v2_name)}':'null'},"area_v2_parent_name": ${area_v2_parent_name != null?'${json.encode(area_v2_parent_name)}':'null'},"playurl": ${playurl != null?'${json.encode(playurl)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"cover": $cover,"owner": $owner}';
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
    return '{"mid": $mid,"face": ${face != null?'${json.encode(face)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
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
    return '{"height": $height,"width": $width,"src": ${src != null?'${json.encode(src)}':'null'}}';
  }
}





