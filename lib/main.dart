import 'package:flutter/material.dart';
import 'package:flutter_net/net/network.dart';
import 'package:flutter_net/tabs/five.dart';
import 'package:flutter_net/tabs/four.dart';
import 'package:flutter_net/tabs/second.dart';
import 'package:flutter_net/tabs/third.dart';

void main() {

  runApp(new MaterialApp(
    // Title
      title: "Using Tabs",
      // Home
      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
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
    controller = new TabController(initialIndex:0,length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar 标题栏
    /*  appBar: new AppBar(
        // Title
        title: new Text("标题栏"),

        // Set the background color of the App Bar
        backgroundColor: Colors.orange,
      ),*/
      // Set the TabBar view as the body of the Scaffold

      body: new TabBarView(

        // Add tabs as widgets
        children: <Widget>[new LoadNetWork(), new SecondTab(), new ThirdTab(),new FourTab(),new FiveTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      /**
       * 底部导航栏bottomNavigationBar
       */
      bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: Colors.teal,
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.favorite),
            ),
            new Tab(
              icon: new Icon(Icons.adb),
            ),
            new Tab(
              icon: new Icon(Icons.airport_shuttle),

            ),
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.zoom_in),
            ),
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.access_alarms),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}