

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FourTab extends StatelessWidget{
  String get src => "https://img.alicdn.com/imgextra/i4/822775056/TB2VBAIbKGSBuNjSspbXXciipXa_!!822775056-0-daren.jpg_430x430.jpg";

  String get data => "第四个页面";


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //背景颜色
      backgroundColor: Colors.cyan,
      body: new Container(
        child: new Center(//外层居中包裹
          child: new Column(//内层竖直排列
            mainAxisAlignment: MainAxisAlignment.center,//内容居中显示
            children: <Widget>[
              new Image.network(src,width: 300.0,height: 300.0,),
              new Text(data,style: TextStyle(color: Colors.blueGrey),)


            ],


          ),

        ),


      ),



    );
  }



}

