import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bee/model/common_model.dart';

/// @author  diaokaibin@gmail.com on 2/17/21.

class HttpTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpTestWidgetStatus();
  }
}

CommonModel commonModel;

class HttpTestWidgetStatus extends State<HttpTestWidget> {

  String showResult = '';


  Future<CommonModel> fetchPost() async {
    Dio dio = Dio();

    Response response = await dio.get(
        "https://www.devio.org/io/flutter_app/json/test_common_model.json");
    if (response.statusCode == HttpStatus.ok) {
      // json.decode()

      commonModel = CommonModel.fromJson(response.data);
      return commonModel;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http test'),
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              fetchPost().then((CommonModel value) {
                setState(() {
                  showResult =
                  '请求结果：\nhideAppBar：${value.hideAppBar}\nicon：${value.icon}';
                });
              });
            },
            child: Text(
              '点我',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Text(showResult),
        ],
      ),
    );
  }
}
