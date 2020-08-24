import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xlunzi/flutter/redux/count_state.dart';
import 'package:flutter_app/cn/xlunzi/flutter/ui_util.dart';
import 'package:redux/redux.dart';

import 'action_reducers.dart';
import 'home_page.dart';

void main() {
  final store = Store<CountState>(reducers, initialState: CountState());
  runApp(HomePage(store));
  UiUtil.setStatusBar(true);
}
