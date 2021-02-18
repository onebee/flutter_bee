import 'package:flutter_bee/http/request/base_request.dart';

/// @author  diaokaibin@gmail.com on 2/18/21.

class ChaptersRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "/wxarticle/chapters/json";
  }
}
