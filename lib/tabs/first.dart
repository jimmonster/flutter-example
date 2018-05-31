
import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  String get src =>
      "https://img.alicdn.com/imgextra/i4/2577106898/TB2h4SRbpuWBuNjSszbXXcS7FXa_!!2577106898-0-daren.jpg";

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.center;
    return new Scaffold(

      body: new ListView(

        children: <Widget>[
          new Image.network(src),
          new Image.network(src),
          new Image.network(src),
          new Image.network(src),
          new Image.network(src),
          new Image.network(src),

        ],
      ),


    );
  }
}