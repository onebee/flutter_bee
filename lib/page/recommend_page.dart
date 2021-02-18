import 'package:flutter/material.dart';
import 'package:flutter_bee/http/hi_dao.dart';
import 'package:flutter_bee/http/hi_error.dart';
import 'package:flutter_bee/model/chapter_base_mode.dart';
import 'package:flutter_bee/model/chapters_model.dart';
import 'package:flutter_bee/model/common_model.dart';
import 'package:flutter_bee/page/base_page.dart';
import 'package:flutter_bee/widget/loading_container.dart';
/// @author  diaokaibin@gmail.com on 2/18/21.

class RecommendPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RecommendPageState();
  }


}

class _RecommendPageState extends BaseState<RecommendPage>{


  int pageIndex = 1;
  List<ChaptersBaseModel> goodsModels;
  bool _loading = true;
  ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _loadData(needCached: true);
  }

  @override
  Widget build(BuildContext context) {
   return LoadingContainer(
     isLoading: _loading,
     child: RefreshIndicator(
       color: Color(0xffd44949),
      onRefresh: (){

      },
       child: MediaQuery.removePadding(
           removeTop: true,
           context: context,
           child: Text("dasfdas")
     ),
   ));
  }

  void _loadData({loadMore = false, needCached = false}) {
    if (loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
    }
    HiDao.getInstance().chapters(this, (ChaptersMode mode){
      setState(() {
        _loading = false;

        var data = mode.data;
        var errorCode = mode.errorCode;
        var errorMsg = mode.errorMsg;

        print('${data} + ${errorMsg} + $errorCode');
      });

    },(HiError error) {
      setState(() {
        _loading = false;

        print('${error.message}');
      });
    });
  }

}