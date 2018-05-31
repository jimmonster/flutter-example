import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.orange,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.airport_shuttle,
                size: 300.0,
                color: Colors.white,
              ),
              new Text(
                "第三个页面",
                style: new TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}