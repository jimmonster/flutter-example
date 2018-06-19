import 'package:flutter/material.dart';
import 'package:flutter_net/tabs/first.dart';
import 'package:flutter_net/tabs/five.dart';
import 'package:flutter_net/tabs/four.dart';
import 'package:flutter_net/tabs/second.dart';
import 'package:flutter_net/tabs/third.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false; //打开视觉调试开关
  runApp(MaterialApp(
      // Title
      title: "Using Tabs",
      // Home
      home: MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    /**
     * @param initState 相当于 onCreate
     */
    super.initState();
    /**
     * TabController
     * @param initialIndex 当前指针的位置
     * @param length 指示器的长度
     * @param vsync  垂直同步
     */
    // Initialize the Tab Controller
    controller = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar 标题栏
      /*  appBar:  AppBar(
        // Title
        title:  Text("标题栏"),

        // Set the background color of the App Bar
        backgroundColor: Colors.orange,
      ),*/
      // Set the TabBar view as the body of the Scaffold

      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          FirstTab(),
          SecondTab(),
          ThirdTab(),
          FourTab(),
          FiveTab()
        ],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      /**
       * 底部导航栏bottomNavigationBar
       */
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.teal,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.adb),
            ),
            Tab(
              icon: Icon(Icons.airport_shuttle),
            ),
            Tab(
              // set icon to the tab
              icon: Icon(Icons.zoom_in),
            ),
            Tab(
              // set icon to the tab
              icon: Icon(Icons.access_alarms),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
