import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xlunzi/flutter/ui_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyLogin());
}

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: LaunchTimes());
  }
}

class LaunchTimes extends StatefulWidget {
  LaunchTimes({Key key}) : super(key: key);

  @override
  _LaunchTimesState createState() => _LaunchTimesState();
}

class _LaunchTimesState extends State<LaunchTimes> {
  int _times = 2020;

  _LaunchTimesState() {
    _initData();
  }

  @override
  void initState() {
    super.initState();
    UiUtil.setStatusBar(true);
  }

  void _initData() async {
    var sp = await SharedPreferences.getInstance();
    var key = "launch_times";
    int value = sp.getInt(key);
    if (value == null) {
      value = 0;
    }
    setState(() {
      _times = value;
    });
    sp.setInt(key, ++value);
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello Flutter',
        home: Scaffold(
          body: Center(
            child: Text(
              "你好小飞_$_times",
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
          ),
        ));
  }
}
