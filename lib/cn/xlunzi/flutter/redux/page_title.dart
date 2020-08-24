import 'package:flutter/material.dart';

Container buildPageTitle(String _title, Matrix4 _matrix4) {
  return Container(
    margin: EdgeInsets.only(top: 50.0, left: 130.0),
    //容器外填充
    constraints: BoxConstraints.tightFor(width: 150.0, height: 100.0),
    //卡片大小
    decoration: BoxDecoration(
        //背景装饰
        gradient: RadialGradient(
            //背景径向渐变
            colors: [Colors.red, Colors.orange], center: Alignment.topLeft, radius: .98),
        boxShadow: [
          //卡片阴影
          BoxShadow(color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
        ]),
    transform: _matrix4,
    //卡片倾斜变换
    alignment: Alignment.center,
    //卡片内文字居中
    child: Text(
      //卡片文字
      _title, style: TextStyle(color: Colors.white, fontSize: 40.0),
    ),
  );
}
