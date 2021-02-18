import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bee/page/demo_page.dart';
import 'package:flutter_bee/page/home_page.dart';
import 'package:flutter_bee/page/recommend_page.dart';

/// @author  diaokaibin@gmail.com on 2/18/21.
class HomeNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeNavigatorState();
  }

}

class _HomeNavigatorState extends State<HomeNavigator> {

  final _defaultColor = Colors.green;
  final _activeColor = Colors.red;
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(

        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: [

          HomePage(

          ),
          DemoPage(
            title: "收藏",
          ),
          DemoPage(
            title: "分类",
          ),
          RecommendPage(
          ),
          DemoPage(
            title: "我的",
          ),
        ],
        physics: NeverScrollableScrollPhysics(),

      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem("首页", Icons.home, 0),
          _bottomItem("收藏", Icons.favorite, 1),
          _bottomItem("分类", Icons.category, 2),
          _bottomItem("推荐", Icons.save, 3),
          _bottomItem("我的", Icons.account_circle, 4),

        ],

        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),


    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(icon: Icon(
      icon,
      color: _defaultColor,

    ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor

          ),
        )
    );
  }


}