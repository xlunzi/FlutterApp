import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xlunzi/flutter/redux/count_state.dart';
import 'package:flutter_app/cn/xlunzi/flutter/redux/page_title.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'calc_page.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final Store<CountState> _store;

  HomePage(this._store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        home: Scaffold(
          body: Stack(
            children: [
              Hero(
                  tag: 'page_title',
                  child: buildPageTitle('首页', Matrix4.rotationZ(.2)),
                  transitionOnUserGestures: true),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 80)),
                    StoreConnector<CountState, int>(
                      converter: (store) => store.state.count,
                      builder: (context, count) =>
                          Text('Count：$count', style: TextStyle(fontSize: 30)),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    StoreConnector<CountState, VoidCallback>(
                      converter: (store) => () async {
                        await Future.delayed(Duration(seconds: 2));
                        return store.dispatch('+');
                      },
                      builder: (context, callback) {
                        return RaisedButton(
                          onPressed: callback,
                          child: Text('delay_+'),
                        );
                      },
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    RaisedButton(
                      onPressed: () {
                        _navigatorKey.currentState.push(MaterialPageRoute(builder: (_) {
                          return CalcPage();
                        }));
                      },
                      child: Text('下一页'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
