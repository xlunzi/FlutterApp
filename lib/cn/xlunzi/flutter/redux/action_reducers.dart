import 'package:redux/redux.dart';

import 'count_state.dart';

final reducers = combineReducers([actionReducers]);

CountState actionReducers(CountState preState, dynamic action) {
  switch (action) {
    case '+':
      return CountState(preState.count + 1);
    default:
      return preState;
  }
}
