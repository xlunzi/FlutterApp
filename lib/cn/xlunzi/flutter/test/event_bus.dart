import 'dart:async';

class EventBus {
  StreamController _streamController;
  Stream _stream;
  Map<String, StreamSubscription> _subscriptionMap;

  EventBus._() {
    _streamController = StreamController.broadcast();
    _stream = _streamController.stream;
    _stream.asBroadcastStream();
    _subscriptionMap = Map();
  }

  void send(event) {
    _streamController.add(event);
  }

  bool hasListener() {
    return _streamController.hasListener;
  }

  void addListener<T>(String name, void Function(T event) onData) {
    if (_subscriptionMap.containsKey(name)) {
      throw "type is exist";
    } else {
      if (T == dynamic) {
        _subscriptionMap[name] = _stream.listen(onData);
      } else {
        _subscriptionMap[name] = _stream.where((event) => event is T).cast<T>().listen(onData);
      }
    }
    return;
  }

  void removeListener(String name) {
    _subscriptionMap[name]?.cancel();
    _subscriptionMap.remove(name);
  }

  /// 单例
  static EventBus _instance;

  static EventBus getInstance() {
    if (_instance == null) {
      _instance = EventBus._();
    }
    return _instance;
  }
}
