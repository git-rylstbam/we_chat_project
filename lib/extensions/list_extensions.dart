/// CreateDate: 2025/1/6 14:17
/// Author: Lee
/// Description:

extension MapWithSeparator<E> on List<E> {
  List<T> mapWithSeparator<T>(
    T Function(E e) separator, {
    T Function(E e)? converter,
  }) =>
      [
        for (var i = 0; i < length; i++) ...[
          if (converter == null) this[i] as T else converter(this[i]),
          if (i < length - 1) separator(this[i]),
        ],
      ];
}
