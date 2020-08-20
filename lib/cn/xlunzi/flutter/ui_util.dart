import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiUtil {
  static void setStatusBar(bool isLight) {
    if (Platform.isAndroid) {
      Brightness brightness;
      if (isLight) {
        brightness = Brightness.dark;
      } else {
        brightness = Brightness.light;
      }
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, statusBarIconBrightness: brightness);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  UiUtil._();
}
