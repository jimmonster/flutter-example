// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection =  Container(
      padding: const EdgeInsets.all(32.0),
      child:  Row(
        children: [
           Expanded(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child:  Text(
                    '糗事百科',
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 Text(
                  '时间疗法',
                  style:  TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
           Icon(
            Icons.star,
            color: Colors.green[300],
          ),
           Text('41'),
        ],
      ),
    );

    
    
    
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(icon, color: color),
           Container(
            margin: const EdgeInsets.only(top: 8.0),
            child:  Text(
              label,
              style:  TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection =  Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.book, '书本'),
          buildButtonColumn(Icons.home, '主页'),
          buildButtonColumn(Icons.share, '分享'),
        ],
      ),
    );

    Widget textSection =  Container(
      padding: const EdgeInsets.all(32.0),
      child:  Text(
      '网上说现在这个年代喜欢一个女孩不要直接口头表白，拒绝了容易尴尬。喜欢一个女孩就约出去看看电影，吃吃美食，然后走在大街上假装不经意的牵女孩的手，如果对方没反感拒绝，就可以进一步找时机试着做下一步亲密的动作！如果女孩都顺着你说明就有戏！看了网上的说法我也试着约了个女孩出来看电影吃饭！然后打算按网上的说法来！！！！！可是。。。。可是。。她老公一直在旁边跟着。直接牵她的手应该不太好吧？',
        softWrap: true,
      ),
    );

    return  MaterialApp(
      title: 'Flutter Demo',
      home:  Scaffold(
        appBar:  AppBar(
          title:  Text('冷笑话精选'),
        ),
        body:  ListView(
          children: [
             Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}