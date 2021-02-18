import 'package:flutter/material.dart';

/// @author  diaokaibin@gmail.com on 2/18/21.

abstract class BaseState<T extends StatefulWidget> extends State<T>{

  bool isInit = false;
  bool isDispose =false;

  @override
  void initState() {
    isInit = true;
    super.initState();
  }

  @override
  void dispose() {
    isDispose = true;
    super.dispose();
  }
}
