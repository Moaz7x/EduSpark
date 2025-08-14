import 'package:flutter/material.dart';

import '../generic_list_view.dart';
import '../tab_bar_widget.dart';
import '../todo_list_item.dart';

class TodoTabView extends StatefulWidget {
  final List<Map<String, dynamic>> allTodos;
  final String searchQuery;

  const TodoTabView({super.key, required this.allTodos, required this.searchQuery});

  @override
  State<TodoTabView> createState() => _TodoTabViewState();
}

class _TodoTabViewState extends State<TodoTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Applies the current search query to a list of todos.
  List<Map<String, dynamic>> _getFilteredTodos(List<Map<String, dynamic>> todos) {
    if (widget.searchQuery.isEmpty) {
      return todos;
    }
    return todos.where((todo) {
      final titleLower = (todo['title'] as String).toLowerCase();
      final searchLower = widget.searchQuery.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
  }

  /// A helper method to build the list view for a given list of todos.
  Widget _buildTodosListView(
    List<Map<String, dynamic>> todos, {
    String emptyMessage = "No todos found.",
  }) {
    return GenericListView(
      itemCount: todos.length,
      emptyMessage: widget.searchQuery.isNotEmpty ? "No search results found." : emptyMessage,
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
        TabBarWidget(tabController: _tabController, tabs: const ['All', 'Pending', 'Completed']),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTodosListView(_getFilteredTodos(widget.allTodos)),
              _buildTodosListView(
                _getFilteredTodos(
                  widget.allTodos.where((t) => !(t['isCompleted'] as bool)).toList(),
                ),
                emptyMessage: "You have no pending todos.",
              ),
              _buildTodosListView(
                _getFilteredTodos(widget.allTodos.where((t) => t['isCompleted'] as bool).toList()),
                emptyMessage: "No todos completed yet.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
