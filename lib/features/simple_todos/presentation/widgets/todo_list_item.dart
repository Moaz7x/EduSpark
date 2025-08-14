import 'package:flutter/material.dart';

import '../screens/todo_detail_screen.dart';
import '../utils/date_time_utils.dart'; // Using our new date utility

// Assuming you have a TodoEntity class that mirrors your TodoModel
// import '../domain/entities/todo_entity.dart';

/// A widget that displays a single Todo item in a list, reflecting the data model.
class TodoListItem extends StatelessWidget {
  // final TodoEntity todo; // In a real app, you'd pass the whole entity
  // const TodoListItem({super.key, required this.todo});

  // Using placeholder data for the prototype
  final int id;
  final String title;
  final bool isCompleted;
  final String priority;
  final DateTime? dueDate;

  const TodoListItem({
    super.key,
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.priority,
    this.dueDate,
  });

  // Helper to get a color based on priority
  Color _getPriorityColor(BuildContext context) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red.shade300;
      case 'medium':
        return Colors.orange.shade300;
      case 'low':
        return Colors.blue.shade300;
      default:
        return Theme.of(context).colorScheme.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Checkbox(
          value: isCompleted,
          onChanged: (bool? value) {
            // TODO: Implement logic to update the todo's completion status
          },
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted ? Colors.grey.shade600 : null,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              Chip(
                label: Text(priority),
                backgroundColor: _getPriorityColor(context),
                padding: EdgeInsets.zero,
                labelStyle: const TextStyle(fontSize: 12),
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(width: 8),
              if (dueDate != null)
                Text(
                  DateTimeUtils.formatDate(dueDate), // Using our utility
                  style: TextStyle(color: Colors.grey.shade400),
                ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // TODO: Pass the actual Todo entity to the detail screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoDetailScreen(todoId: id)),
          );
        },
      ),
    );
  }
}
