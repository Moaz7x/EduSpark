import 'package:edusparkv4/features/simple_todos/data/providers/simple_todos_data_providers.dart';
import 'package:edusparkv4/features/simple_todos/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Represents the state for the entire TodoListScreen.
@immutable
class TodoListScreenState {
  final AsyncValue<List<TodoEntity>> todos;
  final String searchQuery;
  final bool isSearching;

  const TodoListScreenState({
    this.todos = const AsyncLoading(),
    this.searchQuery = '',
    this.isSearching = false,
  });

  TodoListScreenState copyWith({
    AsyncValue<List<TodoEntity>>? todos,
    String? searchQuery,
    bool? isSearching,
  }) {
    return TodoListScreenState(
      todos: todos ?? this.todos,
      searchQuery: searchQuery ?? this.searchQuery,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

/// Notifier to manage the state for the TodoListScreen.
/// It now also manages the TabController.
class TodoListScreenNotifier extends StateNotifier<TodoListScreenState> {
  final Ref _ref;
  // The notifier now takes a TickerProvider, which will be supplied by the UI.
  TodoListScreenNotifier(this._ref, TickerProvider vsync) : super(const TodoListScreenState()) {
    // All controllers are now created and managed here.
    searchController = TextEditingController();
    tabController = TabController(length: 3, vsync: vsync);

    searchController.addListener(() {
      onSearchChanged(searchController.text);
    });

    fetchTodos();
  }

  late final TextEditingController searchController;
  late final TabController tabController;

  Future<void> fetchTodos() async {
    state = state.copyWith(todos: const AsyncLoading());
    final getAllTodosUseCase = _ref.read(getAllTodosUseCaseProvider);
    final result = await getAllTodosUseCase.call();
    result.fold(
      (failure) => state = state.copyWith(todos: AsyncError(failure, StackTrace.current)),
      (todos) => state = state.copyWith(todos: AsyncData(todos)),
    );
  }

  void onSearchChanged(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void toggleSearch() {
    final newIsSearching = !state.isSearching;
    if (!newIsSearching) {
      searchController.clear();
    }
    state = state.copyWith(isSearching: newIsSearching);
  }

  // It's crucial to dispose of all controllers when the provider is disposed.
  @override
  void dispose() {
    searchController.dispose();
    tabController.dispose();
    super.dispose();
  }
}

/// The main provider for the TodoListScreen.
/// It is now a family that requires a TickerProvider to be created.
final todoListScreenProvider =
    StateNotifierProvider.autoDispose.family<TodoListScreenNotifier, TodoListScreenState, TickerProvider>(
  (ref, vsync) {
    return TodoListScreenNotifier(ref, vsync);
  },
);
