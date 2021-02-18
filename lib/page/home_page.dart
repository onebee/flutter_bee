import 'package:flutter/material.dart';
import 'package:flutter_bee/page/tab_page.dart';
import 'package:underline_indicator/underline_indicator.dart';

/// @author  diaokaibin@gmail.com on 2/18/21.

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  static const tabs = [
    '热门',
    '女装',
    '鞋包',
    '百货',
    '手机',
    '食品',
    '男装',
    '数码',
    '手机',
  ];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 30),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              isScrollable: true,
              indicator: UnderlineIndicator(

                strokeCap: StrokeCap.round,
                borderSide: BorderSide(color: Colors.red),
                insets: EdgeInsets.only(bottom: 5)

              ),

              tabs: tabs.map<Tab>((String tab){
                return Tab(
                  text: tab,
                );
              }).toList(),

            ),
          ),
          Flexible(child: TabBarView(
            controller: _tabController,

            children: tabs.map((String tab) {
              return TabPage(
                category: tab,
              );
            }).toList(),
          ))

        ],

      ),
    );
  }
}
