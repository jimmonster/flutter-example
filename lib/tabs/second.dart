import 'package:flutter/material.dart';

class SecondTab extends StatefulWidget {
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {

    tabController=TabController(initialIndex: 0,length:2,vsync: this);

  }
  @override
  void dispose() {
    // Dispose of the Tab Controller
    tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(

//         title: Text('新闻页面的简单实现'),
//         centerTitle: true,
       backgroundColor: Colors.deepOrange,
           title: new TabBar(
             indicatorColor: Colors.yellowAccent,//指示器颜色
             labelColor: Colors.purple,//字体颜色

             isScrollable: false,
             controller: tabController,
             tabs: <Tab>[
               Tab(
                 text: '主页',
               //  icon: Icon(Icons.battery_full),
               ),
               Tab(
                 text: '新闻',
               //  icon: Icon(Icons.assignment),
               )


             ])
       ),

       body: new TabBarView(
           controller: tabController,
           children: <Widget>[
             new MainTabBarView(),
             new NewsTabBarView(),
           ]),


     );
  }


}
/**
 * 主页
 */
class MainTabBarView  extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: ListView(
         children: <Widget>[
           Text('主页数据'),
           Text('主页数据'),
           Text('主页数据'),
           TestView(),
           new Image.network('http://p1.qhimgs4.com/t01b9eb4b9ccbb3e84e.webp',height: 200.0,)


         ],
       ),

     ),


   );
  }





  }


  Widget TestView(){
  //listView 不能嵌套listView
  return Text('自定义的视图');
  }







/**
 * 新闻
 */
class NewsTabBarView  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),
            Text('新闻数据'),

          ],
        ),

      ),



    );}
}

