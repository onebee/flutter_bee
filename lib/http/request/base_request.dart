/// @author  diaokaibin@gmail.com on 2/18/21.
enum HttpMethod { GET, POST }

abstract class BaseRequest {
  String url() {
    return "wanandroid.com";
  }

  HttpMethod httpMethod();

  String path();

  bool needLogin();

  Map<String, String> params = Map();

  Map<String, String> add(String k, Object v) {
    params[k] = v.toString();
    return params;
  }
}
