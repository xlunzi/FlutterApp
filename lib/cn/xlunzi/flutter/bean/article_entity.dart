import 'package:flutter_app/cn/xlunzi/flutter/bean/base_entity.dart';
import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class ArticleEntity extends BaseEntity<ArticleData> with JsonConvert<ArticleEntity> {
  ArticleData data;
}

class ArticleData with JsonConvert<ArticleData> {
  int curPage;
  List<ItemData> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;
}

class ItemData with JsonConvert<ItemData> {
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int realSuperChapterId;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<dynamic> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;
}
