import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bee/http/request/base_request.dart';

import 'hi_error.dart';

/// @author  diaokaibin@gmail.com on 2/18/21.

class HiHttp {
  HiHttp._();

  static HiHttp _instance;

  static HiHttp getInstance() {
    if (_instance == null) {
      _instance = HiHttp._();
    }
    return _instance;
  }

  Future fire(BaseRequest request) async {
    if (request.httpMethod() == HttpMethod.GET) {
      return _doGet(request);
    } else {}
  }

  getHeaderParams() {
    return {"auth-token": "MTU5Mjg1MDg3NDcwNw=="};
  }

  Future _doGet(BaseRequest request) async {
    var uri;
    if (request.params.length != 0) {
      uri = Uri.https(request.url(), request.path(), request.params);
    } else {
      uri = Uri.https(request.url(), request.path());
    }
    var response, result;
    var header = getHeaderParams();

    response =
        await Dio().get(uri.toString(), options: Options(headers: header));
    result = response.data;
    Utf8Decoder utf8decoder = Utf8Decoder(); // FIX  中文乱码

    // result = json.decode(utf8decoder.convert(response.bodyBytes));
    if (response.statusCode == 200) {

      return result;

      // if (result["code"] == 0) {
      //
      //   // } else {
      //   //   throw Exception(result["msg"]);
      //   // }
      // } else if (response.statusCode == 401) {
      //   throw Exception(NeedLogin());
      // } else if (response.statusCode == 403) {
      //   throw Exception(NeedAuth());
      // } else {
      //   throw Exception(
      //       'statusCode:${response.statusCode},message:${result.toString()}');
      // }
    }
  }
}
