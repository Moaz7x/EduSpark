import 'package:edusparkv4/core/widgets/notifiers/custom_list_notifiers.dart';
import 'package:edusparkv4/core/widgets/states/custom_list_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

AutoDisposeStateNotifierProvider<CustomListNotifier<T>, CustomListState<T>> customListProvider<T>(
  List<T> initialItems,
) {
  return StateNotifierProvider.autoDispose<CustomListNotifier<T>, CustomListState<T>>(
    (ref) => CustomListNotifier(CustomListState(items: initialItems)),
  );
}

AutoDisposeStateNotifierProvider<ReorderableListNotifier<T>, ReorderableListState<T>>
reorderableListProvider<T>(List<T> initialItems) {
  return StateNotifierProvider.autoDispose<ReorderableListNotifier<T>, ReorderableListState<T>>(
    (ref) => ReorderableListNotifier(ReorderableListState(items: initialItems)),
  );
}
