import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginatedListState<T> {
  final List<T> items;
  final bool isLoading;
  final String? error;
  final bool hasMore;
  final int currentPage;

  PaginatedListState({
    required this.items,
    this.isLoading = false,
    this.error,
    this.hasMore = true,
    this.currentPage = 0,
  });

  PaginatedListState<T> copyWith({
    List<T>? items,
    bool? isLoading,
    String? error,
    bool? hasMore,
    int? currentPage,
  }) {
    return PaginatedListState<T>(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class PaginatedListNotifier<T> extends StateNotifier<PaginatedListState<T>> {
  PaginatedListNotifier(super.state);

  Future<void> loadMoreItems(Future<List<T>> Function(int page) fetchPage) async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      // Assuming page number starts from 0 or 1. Adjust as needed.
      // For simplicity, let's assume we're just appending new items.
      // A more robust solution would track the current page.
      final newItems = await fetchPage(state.currentPage + 1); // Example: page size 10
      state = state.copyWith(
        items: [...state.items, ...newItems],
        isLoading: false,
        hasMore: newItems.isNotEmpty, // If no new items, no more to load
        currentPage: state.currentPage + 1,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setItems(List<T> newItems) {
    state = state.copyWith(items: newItems);
  }

  void reorderItems(int oldIndex, int newIndex) {
    final List<T> updatedItems = List.from(state.items);
    final T item = updatedItems.removeAt(oldIndex);
    updatedItems.insert(newIndex, item);
    state = state.copyWith(items: updatedItems);
  }
}

AutoDisposeStateNotifierProvider<PaginatedListNotifier<T>, PaginatedListState<T>> paginatedListProvider<T>(List<T> initialItems) {
   return StateNotifierProvider.autoDispose<PaginatedListNotifier<T>, PaginatedListState<T>>(
     (ref) => PaginatedListNotifier<T>(PaginatedListState<T>(items: initialItems)),
   );
 }
