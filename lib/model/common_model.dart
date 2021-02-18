/// icon : "https://www.devio.org/io/flutter_app/img/ln_food.png"
/// title : "美食林"
/// url : "https://m.ctrip.com/webapp/you/foods/address.html?new=1&ishideheader=true"
/// statusBarColor : "19A0F0"
/// hideAppBar : true

class CommonModel {
  String _icon;
  String _title;
  String _url;
  String _statusBarColor;
  bool _hideAppBar;

  String get icon => _icon;
  String get title => _title;
  String get url => _url;
  String get statusBarColor => _statusBarColor;
  bool get hideAppBar => _hideAppBar;

  CommonModel({
      String icon, 
      String title, 
      String url, 
      String statusBarColor, 
      bool hideAppBar}){
    _icon = icon;
    _title = title;
    _url = url;
    _statusBarColor = statusBarColor;
    _hideAppBar = hideAppBar;
}

  CommonModel.fromJson(dynamic json) {
    _icon = json["icon"];
    _title = json["title"];
    _url = json["url"];
    _statusBarColor = json["statusBarColor"];
    _hideAppBar = json["hideAppBar"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["icon"] = _icon;
    map["title"] = _title;
    map["url"] = _url;
    map["statusBarColor"] = _statusBarColor;
    map["hideAppBar"] = _hideAppBar;
    return map;
  }

}