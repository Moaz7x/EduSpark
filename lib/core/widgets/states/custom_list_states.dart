import 'package:flutter/foundation.dart';

class CustomListState<T> {
  final List<T> items;
  final bool isLoading;
  final String? error;

  CustomListState({
    required this.items,
    this.isLoading = false,
    this.error,
  });

  CustomListState<T> copyWith({
    List<T>? items,
    bool? isLoading,
    String? error,
  }) {
    return CustomListState<T>(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomListState<T> &&
        listEquals(other.items, items) &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  @override
  int get hashCode => items.hashCode ^ isLoading.hashCode ^ error.hashCode;
}

class ReorderableListState<T> extends CustomListState<T> {
  ReorderableListState({
    required super.items,
    super.isLoading = false,
    super.error,
  });

  @override
  ReorderableListState<T> copyWith({
    List<T>? items,
    bool? isLoading,
    String? error,
  }) {
    return ReorderableListState<T>(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}