import 'package:flutter/material.dart';

/// @author  diaokaibin@gmail.com on 2/18/21.

class DemoPage extends StatefulWidget {
  final String title;

  const DemoPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DemoPageState();
  }
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(color: Colors.amberAccent, fontSize: 25),
        ),
      ),
    );
  }
}
