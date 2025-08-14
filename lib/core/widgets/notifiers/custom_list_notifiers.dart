import 'package:edusparkv4/core/widgets/states/custom_list_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomListNotifier<T> extends StateNotifier<CustomListState<T>> {
  CustomListNotifier(super.state);

  void setItems(List<T> newItems) {
    state = state.copyWith(items: newItems);
  }

  void addItem(T item) {
    state = state.copyWith(items: [...state.items, item]);
  }

  void removeItem(T item) {
    state = state.copyWith(items: state.items.where((e) => e != item).toList());
  }

  void updateItem(T oldItem, T newItem) {
    state = state.copyWith(items: state.items.map((e) => e == oldItem ? newItem : e).toList());
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }
}

class ReorderableListNotifier<T> extends StateNotifier<ReorderableListState<T>> {
  ReorderableListNotifier(super.state);

  void reorderItems(int oldIndex, int newIndex) {
    final List<T> items = List.from(state.items);
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final T item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    state = state.copyWith(items: items);
  }

  void setItems(List<T> newItems) {
    state = state.copyWith(items: newItems);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }
}
