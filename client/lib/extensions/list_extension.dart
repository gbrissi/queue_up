extension ListExtension<T> on List<T?> {
  T? getOrNull(int index) => index < length ? this[index] : null;
  T? firstWhereOrNull(bool Function(T? element) test) =>
      firstWhere(test, orElse: () => null);
}
