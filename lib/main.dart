import 'package:flutter/material.dart';
import 'package:flutter_bee/navigator/home_navigator.dart';
import 'package:flutter_bee/page/http_test.dart';

void main() {
  runApp(MyApp(HomeNavigator()));
}

class MyApp extends StatelessWidget {

  final Widget page;
  const MyApp(this.page);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bee',
      home: page,
    );
  }
}
