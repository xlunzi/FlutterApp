import 'HttpManager.dart';

class Api {
  static const String _ARTICLE_LIST = "article/list/";

  static const String _BANNER = "banner/json";

  static Future<dynamic> getBanner() async {
    return await HttpManager().request(_BANNER);
  }

  static Future<dynamic> getArticleList(int page) async {
    return HttpManager().request('$_ARTICLE_LIST$page/json');
  }

  Api._();
}
