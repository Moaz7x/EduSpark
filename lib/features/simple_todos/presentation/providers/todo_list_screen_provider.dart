import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// In a real app, you would import your entity
// import '../../domain/entities/todo_entity.dart';

/// Represents the state for the entire TodoListScreen.
@immutable
class TodoListScreenState {
  // In a real app, this would be AsyncValue<List<TodoEntity>>
  final List<Map<String, dynamic>> allTodos;
  final String searchQuery;
  final bool isSearching;

  const TodoListScreenState({
    this.allTodos = const [],
    this.searchQuery = '',
    this.isSearching = false,
  });

  TodoListScreenState copyWith({
    List<Map<String, dynamic>>? allTodos,
    String? searchQuery,
    bool? isSearching,
  }) {
    return TodoListScreenState(
      allTodos: allTodos ?? this.allTodos,
      searchQuery: searchQuery ?? this.searchQuery,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

/// Notifier to manage the state for the TodoListScreen.
class TodoListScreenNotifier extends StateNotifier<TodoListScreenState> {
  // We need a TickerProvider, which we will get from the provider itself.
  TodoListScreenNotifier(TickerProvider vsync) : super(const TodoListScreenState()) {
    // --- MANAGE ALL CONTROLLERS HERE ---
    searchController = TextEditingController();
    tabController = TabController(length: 3, vsync: vsync);

    // Add listener for search controller
    searchController.addListener(() {
      onSearchChanged(searchController.text);
    });

    _fetchTodos();
  }

  late final TextEditingController searchController;
  late final TabController tabController;

  void _fetchTodos() {
    // TODO: Replace this with a call to your use case.
    // --- MOCK DATA FOR PROTOTYPE ---
    final mockTodos = [
      {'id': 1, 'title': 'Design the new app dashboard', 'isCompleted': false, 'priority': 'High', 'dueDate': DateTime.now().add(const Duration(days: 2))},
      {'id': 2, 'title': 'Develop the authentication flow', 'isCompleted': true, 'priority': 'High', 'dueDate': DateTime.now().subtract(const Duration(days: 5))},
      {'id': 3, 'title': 'Write API documentation', 'isCompleted': false, 'priority': 'Medium', 'dueDate': DateTime.now().add(const Duration(days: 10))},
    ];
    state = state.copyWith(allTodos: mockTodos);
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
/// We can no longer use .autoDispose if we need to pass a TickerProvider.
final todoListScreenProvider = StateNotifierProvider<TodoListScreenNotifier, TodoListScreenState>((ref) {
  // This is a placeholder. The actual TickerProvider will be supplied by the UI.
  // This will cause an error if not overridden, which is what we want.
  throw UnimplementedError('TickerProvider must be provided');
});
