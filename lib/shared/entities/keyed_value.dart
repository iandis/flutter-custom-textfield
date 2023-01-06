class KeyedValue<T> {
  const KeyedValue({
    required this.key,
    required this.value,
  });

  final Object? key;
  final T value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KeyedValue<T> &&
        other.runtimeType == runtimeType &&
        other.key == key &&
        other.value == value;
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, value);
}
