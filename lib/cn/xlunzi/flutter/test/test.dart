import 'dart:isolate';
import 'dart:math' show Random;

import 'math_util.dart';

typedef void MathSort(List<num> list);

void main() {
  Random random = Random();
  int step = 1000;
  int max = 100 * step;
  var insertList = List.generate(10 * step, (index) => random.nextInt(max));

  var bubbleList = List<int>();
  insertList.forEach((element) {
    bubbleList.add(element);
  });

  var quickList = List<int>();
  insertList.forEach((element) {
    quickList.add(element);
  });

  var selectList = List<int>();
  insertList.forEach((element) {
    selectList.add(element);
  });

  var heapList = List<int>();
  insertList.forEach((element) {
    heapList.add(element);
  });

  var isolateList = List<int>();
  insertList.forEach((element) {
    isolateList.add(element);
  });

  print('list：');
  print(insertList);

  ReceivePort receivePort = ReceivePort();
  receivePort.listen((message) {
    if (message is SendPort) {
      message.send(isolateList);
      message.send(Test.quick);
      message.send("end");
      receivePort.close();
    }
  });
  Isolate.spawn(entryPoint, receivePort.sendPort);

  quickList.insert(0, 1);
  Isolate.spawn(selectSort, quickList);
  insertList.insert(0, 2);
  Isolate.spawn(selectSort, insertList);
  bubbleList.insert(0, 3);
  Isolate.spawn(selectSort, bubbleList);
  selectList.insert(0, 4);
  Isolate.spawn(selectSort, selectList);
  heapList.insert(0, 5);
  Isolate.spawn(selectSort, heapList);

  Future.delayed(Duration(seconds: 3));
}

var isolateList;

void entryPoint(SendPort sendPort) {
  ReceivePort receivePort = ReceivePort();
  receivePort.listen((message) {
    if (message is List) {
      isolateList = message;
    } else if (message is MathSort) {
      message(isolateList);
    } else {
      print(message);
      receivePort.close();
    }
  });
  sendPort.send(receivePort.sendPort);
}

void selectSort(List<num> list) {
  var type = list[0];
  switch (type) {
    case 1:
      Test.quick(list);
      break;
    case 2:
      Test.insert(list);
      break;
    case 3:
      Test.bubble(list);
      break;
    case 4:
      Test.select(list);
      break;
    case 5:
      Test.heap(list);
      break;
  }
}

class Test {
  static void quick(List<num> list) {
    var start = DateTime.now().millisecondsSinceEpoch;
    var num = list.removeAt(0);
    var first = list[0];
    Sort.quick(list);
    var end = DateTime.now().millisecondsSinceEpoch;
    print('quick：${end - start} -- $first');
    list.insert(0, num);
    print(list);
  }

  static void insert(List<num> list) {
    var start = DateTime.now().millisecondsSinceEpoch;
    var num = list.removeAt(0);
    var first = list[0];
    Sort.insert(list);
    var end = DateTime.now().millisecondsSinceEpoch;
    print('insert：${end - start} -- $first');
    list.insert(0, num);
    print(list);
  }

  static void bubble(List<num> list) {
    var start = DateTime.now().millisecondsSinceEpoch;
    var num = list.removeAt(0);
    var first = list[0];
    Sort.bubble(list);
    var end = DateTime.now().millisecondsSinceEpoch;
    print('bubble：${end - start} -- $first');
    list.insert(0, num);
    print(list);
  }

  static void select(List<num> list) {
    var start = DateTime.now().millisecondsSinceEpoch;
    var num = list.removeAt(0);
    var first = list[0];
    Sort.select(list);
    var end = DateTime.now().millisecondsSinceEpoch;
    print('select：${end - start} -- $first');
    list.insert(0, num);
    print(list);
  }

  static void heap(List<num> list) {
    var start = DateTime.now().millisecondsSinceEpoch;
    var num = list.removeAt(0);
    var first = list[0];
    Sort.heap(list);
    var end = DateTime.now().millisecondsSinceEpoch;
    print('heap：${end - start} -- $first');
    list.insert(0, num);
    print(list);
  }
}
