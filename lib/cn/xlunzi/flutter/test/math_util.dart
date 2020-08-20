class Sort {
  /// 选择排序
  static void select(List<num> list) {
    for (var i = 0; i < list.length - 1; ++i) {
      for (var j = i + 1; j < list.length; ++j) {
        if (list[i] > list[j]) {
          _swap(list, i, j);
        }
      }
    }
  }

  /// 冒泡排序
  static void bubble(List<num> list) {
    for (int i = list.length; i > 0; --i) {
      bool flag = true;
      for (int j = 0; j < i - 1; ++j) {
        if (list[j] > list[j + 1]) {
          _swap(list, j, j + 1);
          flag = false;
        }
      }
      if (flag) {
        break;
      }
    }
  }

  /// 插入排序
  static void insert(List<num> list) {
    for (int i = 1; i < list.length; ++i) {
      int j = i;
      do {
        if (list[j] < list[j - 1]) {
          _swap(list, j, j - 1);
        }
        j--;
      } while (j > 0);
    }
  }

  /// 快速排序
  static void quick(List<num> list) {
    _quick(list, 0, list.length - 1);
  }

  static void _quick(List<num> list, int start, int end) {
    var pivot = list[start];
    int i = start;
    int j = end;
    while (i < j) {
      while (i < j && list[j] > pivot) {
        j--;
      }
      while (i < j && list[i] < pivot) {
        i++;
      }
      if (list[i] == list[j] && i < j) {
        i++;
      } else {
        _swap(list, i, j);
      }
    }
    if (i - 1 > start) {
      _quick(list, start, i - 1);
    }
    if (j + 1 < end) {
      _quick(list, j + 1, end);
    }
  }

  static void _swap(List<num> x, int i, int j) {
    var temp = x[i];
    x[i] = x[j];
    x[j] = temp;
  }

  /// 堆排序
  static void heap(List<num> list) {
    for (int i = (list.length / 2 - 1).toInt(); i >= 0; --i) {
      _adjustHeap(list, i, list.length);
    }
    for (var j = list.length - 1; j > 0; --j) {
      _swap(list, 0, j);
      _adjustHeap(list, 0, j);
    }
  }

  static void _adjustHeap(List<num> list, int i, int length) {
    var temp = list[i];
    for (int k = i * 2 + 1; k < length; k = k * 2 + 1) {
      if (k + 1 < length && list[k] < list[k + 1]) {
        k++;
      }
      if (list[k] > temp) {
        list[i] = list[k];
        i = k;
      } else {
        break;
      }
    }
    list[i] = temp;
  }

  Sort._();
}
