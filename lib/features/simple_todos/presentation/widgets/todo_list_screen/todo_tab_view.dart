import 'package:flutter/material.dart';
import '../generic_list_view.dart';
import '../tab_bar_widget.dart';
import '../todo_list_item.dart';

/// A stateless widget that displays the tab bar and the corresponding list of todos.
/// The TabController is managed by the parent widget and passed in.
class TodoTabView extends StatelessWidget {
  final TabController tabController;
  final List<Map<String, dynamic>> allTodos;
  final String searchQuery;

  const TodoTabView({
    super.key,
    required this.tabController,
    required this.allTodos,
    required this.searchQuery,
  });

  // ... (The helper methods _getFilteredTodos and _buildTodosListView remain exactly the same)
  List<Map<String, dynamic>> _getFilteredTodos(List<Map<String, dynamic>> todos) {
    if (searchQuery.isEmpty) {
      return todos;
    }
    return todos.where((todo) {
      final titleLower = (todo['title'] as String).toLowerCase();
      final searchLower = searchQuery.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
  }

  Widget _buildTodosListView(
    List<Map<String, dynamic>> todos, {
    String emptyMessage = "No todos found.",
  }) {
    return GenericListView(
      itemCount: todos.length,
      emptyMessage: searchQuery.isNotEmpty ? "No search results found." : emptyMessage,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoListItem(
          id: todo['id'] as int,
          title: todo['title'] as String,
          isCompleted: todo['isCompleted'] as bool,
          priority: todo['priority'] as String,
          dueDate: todo['dueDate'] as DateTime?,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The TabBarWidget receives the controller from the parent.
        TabBarWidget(
          tabController: tabController,
          tabs: const ['All', 'Pending', 'Completed'],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              _buildTodosListView(_getFilteredTodos(allTodos)),
              _buildTodosListView(
                _getFilteredTodos(allTodos.where((t) => !(t['isCompleted'] as bool)).toList()),
                emptyMessage: "You have no pending todos.",
              ),
              _buildTodosListView(
                _getFilteredTodos(allTodos.where((t) => t['isCompleted'] as bool).toList()),
                emptyMessage: "No todos completed yet.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
