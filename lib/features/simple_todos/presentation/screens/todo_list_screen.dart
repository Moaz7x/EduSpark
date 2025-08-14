import 'package:flutter/material.dart';

import '../utils/modal_bottom_sheet_utils.dart';
import '../widgets/forms/add_edit_todo_form.dart';
import '../widgets/todo_list_screen/todo_list_app_bar.dart';
import '../widgets/todo_list_screen/todo_tab_view.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  String _searchQuery = '';

  // --- MOCK DATA FOR PROTOTYPE ---
  // In a real app, this list would come from a Riverpod provider.
  final List<Map<String, dynamic>> _allTodos = [
    {
      'id': 1,
      'title': 'Design the new app dashboard',
      'isCompleted': false,
      'priority': 'High',
      'dueDate': DateTime.now().add(const Duration(days: 2)),
    },
    {
      'id': 2,
      'title': 'Develop the authentication flow',
      'isCompleted': true,
      'priority': 'High',
      'dueDate': DateTime.now().subtract(const Duration(days: 5)),
    },
    {
      'id': 3,
      'title': 'Write API documentation',
      'isCompleted': false,
      'priority': 'Medium',
      'dueDate': DateTime.now().add(const Duration(days: 10)),
    },
    {
      'id': 4,
      'title': 'Set up the CI/CD pipeline',
      'isCompleted': false,
      'priority': 'Low',
      'dueDate': DateTime.now().add(const Duration(days: 25)),
    },
    {
      'id': 5,
      'title': 'Review team pull requests',
      'isCompleted': true,
      'priority': 'Medium',
      'dueDate': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'id': 6,
      'title': 'Plan the next sprint',
      'isCompleted': false,
      'priority': 'High',
      'dueDate': DateTime.now().add(const Duration(days: 1)),
    },
    {
      'id': 7,
      'title': 'Fix bug #117 in production',
      'isCompleted': false,
      'priority': 'High',
      'dueDate': DateTime.now(),
    },
    {
      'id': 8,
      'title': 'Update third-party libraries',
      'isCompleted': true,
      'priority': 'Low',
      'dueDate': DateTime.now().subtract(const Duration(days: 12)),
    },
  ];
  // --- END MOCK DATA ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoListAppBar(
        onSearchChanged: (query) {
          setState(() {
            _searchQuery = query;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ModalBottomSheetUtils.showAppModalBottomSheet(
            context: context,
            title: 'Add New Todo',
            child: const AddEditTodoForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: TodoTabView(allTodos: _allTodos, searchQuery: _searchQuery),
    );
  }
}
