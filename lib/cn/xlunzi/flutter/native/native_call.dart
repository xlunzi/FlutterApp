import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show MethodChannel, MissingPluginException, PlatformException;

class NativeCall {
  static NativeCall _instance;

  /// MethodChannel
  static const String _channel = 'cn.xlunzi.flutter/native_method';

  /// 定义的方法名
  static const String _getSignId = 'get_sign_id';

  static const String _flutterMethodHello = 'flutter_method_hello';

  /// 获取设备标识id
  Future<String> getSignId() => _invoke(_getSignId);

  final _platform = const MethodChannel(_channel);

  Future<T> _invoke<T>(String _methodId) async {
    T result;
    try {
      result = await _platform.invokeMethod(_methodId);
    } on PlatformException catch (e, s) {
      debugPrint("$e -- \n${s.toString()}");
    } on MissingPluginException catch (e, s) {
      debugPrint("$e -- \n${s.toString()}");
    }
    return result;
  }

  factory NativeCall() {
    if (_instance == null) {
      _instance = NativeCall._();
    }
    return _instance;
  }

  NativeCall._() {
    _platform.setMethodCallHandler((call) async {
      debugPrint('call_from_native：${call.method}');
      switch (call.method) {
        case _flutterMethodHello:
          debugPrint('1');
          return 'Hello Flutter';
      }
      debugPrint('2');
      return null;
    });
  }
}
