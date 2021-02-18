import 'package:flutter/material.dart';

/**
 * @author  diaokaibin@gmail.com on 2/18/21.
 */

class TabPage extends StatefulWidget {
  final String category;
  const TabPage({Key key, this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabPageState();
  }
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.orangeAccent),
        child: Center(
          child: Text(
            widget.category,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),

      ),
    );
  }
}
