import 'package:edusparkv4/features/simple_todos/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Required for AsyncValue

import '../generic_list_view.dart';
import '../tab_bar_widget.dart';
import '../todo_list_item.dart';

/// A stateless widget that displays the tab bar and the corresponding list of todos.
/// It uses the TabController from its parent and handles different data states.
class TodoTabView extends StatelessWidget {
  final TabController tabController;
  // The list of todos is now an AsyncValue to handle loading and error states.
  final AsyncValue<List<TodoEntity>> todos;
  final String searchQuery;

  const TodoTabView({
    super.key,
    required this.tabController,
    required this.todos,
    required this.searchQuery,
  });

  /// Applies the current search query to a list of todos.
  List<TodoEntity> _getFilteredTodos(List<TodoEntity> todos) {
    if (searchQuery.isEmpty) {
      return todos;
    }
    // A more robust search could check multiple fields.
    return todos.where((todo) {
      return todo.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  /// A helper method to build the list view for a given list of todos.
  Widget _buildTodosListView(List<TodoEntity> todos, {String emptyMessage = "No todos found."}) {
    return GenericListView(
      itemCount: todos.length,
      emptyMessage: searchQuery.isNotEmpty ? "No search results found." : emptyMessage,
      itemBuilder: (context, index) {
        final todo = todos[index];
        // Pass the real TodoEntity to the list item widget.
        return TodoListItem(
          id: todo.id!,
          title: todo.title,
          isCompleted: todo.isCompleted ?? false,
          priority: todo.priority,
          dueDate: todo.dueDate,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use .when to handle loading, error, and data states gracefully.
    // This is the standard, robust way to handle asynchronous data in the UI.
    return todos.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Failed to load todos.\nError: $error',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ),
      data: (allTodos) {
        // Once we have data, we build the tab view as before.
        return Column(
          children: [
            TabBarWidget(tabController: tabController, tabs: const ['All', 'Pending', 'Completed']),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  // "All" Tab
                  _buildTodosListView(_getFilteredTodos(allTodos)),
                  // "Pending" Tab
                  _buildTodosListView(
                    _getFilteredTodos(allTodos.where((t) => !(t.isCompleted ?? false)).toList()),
                    emptyMessage: "You have no pending todos. Great job!",
                  ),
                  // "Completed" Tab
                  _buildTodosListView(
                    _getFilteredTodos(allTodos.where((t) => t.isCompleted ?? false).toList()),
                    emptyMessage: "No todos completed yet.",
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
