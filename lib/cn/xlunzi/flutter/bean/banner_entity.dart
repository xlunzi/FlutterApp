import 'package:flutter_app/cn/xlunzi/flutter/bean/base_entity.dart';
import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class BannerEntity extends BaseEntity<List<BannerData>> with JsonConvert<BannerEntity> {
  List<BannerData> data;

  @override
  String toString() {
    return 'BannerEntity{data: $data}';
  }
}

class BannerData with JsonConvert<BannerData> {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  @override
  String toString() {
    return 'BannerData{desc: $desc, id: $id, imagePath: $imagePath, isVisible: $isVisible, order: $order, title: $title, type: $type, url: $url}';
  }
}
