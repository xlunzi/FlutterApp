// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_app/cn/xlunzi/flutter/bean/article_entity.dart';
import 'package:flutter_app/generated/json/article_entity_helper.dart';
import 'package:flutter_app/cn/xlunzi/flutter/bean/banner_entity.dart';
import 'package:flutter_app/generated/json/banner_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case ArticleEntity:
			return articleEntityFromJson(data as ArticleEntity, json) as T;			case ArticleData:
			return articleDataFromJson(data as ArticleData, json) as T;			case ItemData:
			return itemDataFromJson(data as ItemData, json) as T;			case BannerEntity:
			return bannerEntityFromJson(data as BannerEntity, json) as T;			case BannerData:
			return bannerDataFromJson(data as BannerData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case ArticleEntity:
			return articleEntityToJson(data as ArticleEntity);			case ArticleData:
			return articleDataToJson(data as ArticleData);			case ItemData:
			return itemDataToJson(data as ItemData);			case BannerEntity:
			return bannerEntityToJson(data as BannerEntity);			case BannerData:
			return bannerDataToJson(data as BannerData);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'ArticleEntity':
			return ArticleEntity().fromJson(json);			case 'ArticleData':
			return ArticleData().fromJson(json);			case 'ItemData':
			return ItemData().fromJson(json);			case 'BannerEntity':
			return BannerEntity().fromJson(json);			case 'BannerData':
			return BannerData().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'ArticleEntity':
			return List<ArticleEntity>();			case 'ArticleData':
			return List<ArticleData>();			case 'ItemData':
			return List<ItemData>();			case 'BannerEntity':
			return List<BannerEntity>();			case 'BannerData':
			return List<BannerData>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}