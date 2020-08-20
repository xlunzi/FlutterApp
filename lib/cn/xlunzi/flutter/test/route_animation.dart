import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/cn/xlunzi/flutter/ui_util.dart';

void main() {
  runApp(MyApp());
  UiUtil.setStatusBar(true);
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      routes: {
        "/": (_) => Page1(_navigatorKey),
        '/page2': (_) => Page2(),
      },
    );
  }
}

class Page1 extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey;

  Page1(this._navigatorKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: InkWell(
                onTap: () {
                  _navigatorKey.currentState.push(MaterialPageRoute(
                    builder: (_) => Page2(),
                  ));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 18.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/logo.png"),
                        radius: 38.0,
                      ),
                    ),
                    Text(
                      'Hello',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('收藏'),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 200),
            ),
            RaisedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 220),
                    pageBuilder: (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1.0, 0.0),
                            end: Offset(0.0, 0.0),
                          ).animate(animation),
                          child: Page2(),
                        ),
                      );
                    },
                  ),
                );
                debugPrint('onBack $result');
              },
              child: Text('下一个'),
            ),
            RaisedButton(
              child: Text('pushNamed'),
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
            ),
            FloatingActionButton(
              onPressed: () async {
                const platform = const MethodChannel('cn.xlunzi.flutter/native_method');
                String signId;
                try {
                  signId = await platform.invokeMethod('get_sign_id');
                } on PlatformException catch (e, s) {
                  debugPrint("$e -- \n${s.toString()}");
                } on MissingPluginException catch (e, s) {
                  debugPrint("$e -- \n${s.toString()}");
                }
                print('signId = $signId');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context, '我回来了');
          },
          child: Text('返回：$hashCode'),
        ),
      ),
    );
  }
}
