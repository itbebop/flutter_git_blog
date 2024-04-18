extension SortedList<T> on List<T> {
  List<T> sorted(int Function(T a, T b) compare) {
    var list = List<T>.from(this);
    list.sort(compare);
    return list;
  }
}
