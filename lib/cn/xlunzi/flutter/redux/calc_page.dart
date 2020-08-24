import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xlunzi/flutter/redux/page_title.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vector_math/vector_math_64.dart';

import 'count_state.dart';

class CalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(tag: 'page_title', child: buildPageTitle('计算', Matrix4.rotationZ(.25))),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StoreConnector<CountState, int>(
                  converter: (store) => store.state.count,
                  builder: (context, count) => Text('count：$count'),
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                StoreConnector<CountState, VoidCallback>(
                  converter: (Store<CountState> store) {
                    return () => store.dispatch('+');
                  },
                  builder: (context, callback) {
                    return RaisedButton(
                      onPressed: callback,
                      child: Text('+'),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
