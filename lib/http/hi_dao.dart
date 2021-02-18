import 'package:flutter_bee/http/request/base_request.dart';
import 'package:flutter_bee/http/request/chapters_request.dart';
import 'package:flutter_bee/model/chapters_model.dart';
import 'package:flutter_bee/page/base_page.dart';

import 'hi_error.dart';
import 'hi_http.dart';

class HiDao {
  HiDao._();

  static HiDao _instance;

  static HiDao getInstance() {
    if (_instance == null) {
      _instance = HiDao._();
    }
    return _instance;
  }

  var _cached = Map();

  bool containCached(String key) {
    return _cached.containsKey(key);
  }

  void chapters(BaseState state, Function(ChaptersMode) success, Function(HiError) error) async {
    _send(ChaptersRequest(), state, success, error);
  }

  void _send(BaseRequest request, BaseState state, Function(ChaptersMode) success,
      Function(HiError) error) async {
    try {
      var result = await HiHttp.getInstance().fire(request);
      var model = ChaptersMode.fromJson(result);
      if (state != null && state.isDispose) return;
      success(model);
    } catch (e) {
      if (state != null && state.isDispose) return;
      error(e.message);
      print('hi-dao:${e.toString()}');
    }
  }
}
