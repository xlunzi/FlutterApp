import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xlunzi/flutter/bean/article_entity.dart';
import 'package:flutter_app/cn/xlunzi/flutter/bean/banner_entity.dart';
import 'package:flutter_app/cn/xlunzi/flutter/constant/config.dart';
import 'package:flutter_app/cn/xlunzi/flutter/http/api.dart';

import '../ui_util.dart';
import 'home_list_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading;
  List<BannerData> _banners;
  List<ItemData> _articleDataList;
  int _curPage;
  int _pageCount;

  ScrollController _controller;

  _HomePageState() {
    _isLoading = true;
    _banners = List();
    _articleDataList = List();
    _curPage = 0;
    _pageCount = 0;
    _controller = ScrollController();
  }

  @override
  void initState() {
    super.initState();
    UiUtil.setStatusBar(true);

    _controller.addListener(() {
      var _maxScrollExtent = _controller.position.maxScrollExtent;
      var _pixels = _controller.position.pixels;
      // debugPrint('max = $_maxScrollExtent -- pixels = $_pixels');
      // debugPrint('_curPage = $_curPage -- _pageCount = $_pageCount');
      if (_maxScrollExtent == _pixels && _curPage < _pageCount) {
        _getArticleList(++_curPage);
      }
    });

    _onRefresh();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    var futures = [_getBanner(), _getArticleList(0)];
    await Future.wait(futures);
    debugPrint('end');
    setState(() {
      _isLoading = false;
    });
    return null;
  }

  Future<dynamic> _getBanner() async {
    dynamic data = await Api.getBanner();
    BannerEntity _bannerEntity;
    try {
      if (data != null) {
        _bannerEntity = BannerEntity().fromJson(data);
      }
    } catch (e, s) {
      debugPrint(e);
    }
    if (_bannerEntity != null) {
      _banners.clear();
      _banners.addAll(_bannerEntity.data);
    }
    return null;
  }

  Future _getArticleList(int page) {
    if (page != 0 && page >= _pageCount) {
      debugPrint('page = $page -- pageCount = $_pageCount');
      return null;
    }
    return Api.getArticleList(page).then((data) {
      ArticleEntity _articleEntity;
      try {
        if (data != null) {
          _articleEntity = ArticleEntity().fromJson(data);
        }
      } catch (e, s) {
        debugPrint(e);
      }
      if (_articleEntity != null) {
        ArticleData _articleData = _articleEntity.data;
        _curPage = _articleData?.curPage ?? 0;
        _pageCount = _articleData?.pageCount ?? 0;
        debugPrint('curPage = $_curPage -- pageCount = $_pageCount');

        if (page == 0) {
          _articleDataList.clear();
        }
        _articleDataList.addAll(_articleData.datas);

        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.TITLE,
      home: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          centerTitle: true,
        ),
        body: _bodyWidget(),
      ),
    );
  }

  Stack _bodyWidget() {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: !_isLoading,
          child: Center(child: CircularProgressIndicator()),
        ),
        Offstage(
          offstage: _isLoading,
          child: RefreshIndicator(
            child: ListView.builder(
              itemCount: _articleDataList.length + 1,
              itemBuilder: (context, i) => _buildItem(context, i),
              controller: _controller,
            ),
            onRefresh: _onRefresh,
          ),
        )
      ],
    );
  }

  Widget _bannerView() {
    var list = _banners.map((data) {
      return Image.network(data.imagePath);
    }).toList();
    return list.isNotEmpty
        ? BannerView(
            list,
            intervalDuration: Duration(seconds: 3),
            log: false,
          )
        : null;
  }

  Widget _buildItem(BuildContext context, int i) {
    if (i == 0) {
      return Container(
        height: MediaQuery.of(context).size.width / 360 * 200,
        child: _bannerView(),
      );
    }
    return HomeListItem(_articleDataList[i - 1]);
  }
}
