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
      appBar: AppBar(

        title:  Text('布局样式',),
        centerTitle: true,

      ),
        body: Container(
          color: Colors.black12,
          margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Image.asset('images/lake.jpg',
                  width: 100.0, height: 100.0, fit: BoxFit.fill),
              new Image.asset('images/lake.jpg',
                  width: 100.0, height: 100.0, fit: BoxFit.fill),
              new Image.asset('images/lake.jpg',
                  width: 100.0, height: 100.0, fit: BoxFit.fill)

            ],
          ),


    ));
  }
}
