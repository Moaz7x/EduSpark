import 'package:edusparkv4/features/simple_todos/presentation/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class DetailCardWidget extends StatelessWidget {
  // In a real app, you would pass the full TodoEntity object.
  // final TodoEntity todo;
  // const DetailCardWidget({super.key, required this.todo});

  const DetailCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data for the prototype
    final todo = {
      'title': 'Design the new app dashboard',
      'description':
          'Create a comprehensive design in Figma, including all states for interactive elements. Ensure the design is responsive and accessible.',
      'priority': 'High',
      'isCompleted': false,
      'dueDate': DateTime.now().add(const Duration(days: 5)),
      'createdAt': DateTime.now().subtract(const Duration(days: 2)),
    };

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo['title'] as String, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            if ((todo['description'] as String).isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  todo['description'] as String,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade400),
                ),
              ),
            const Divider(height: 20),
            _buildDetailRow(
              context,
              'Status:',
              Chip(
                label: Text(todo['isCompleted'] as bool ? 'Completed' : 'Pending'),
                backgroundColor: todo['isCompleted'] as bool
                    ? Colors.green.shade800
                    : Colors.orange.shade800,
              ),
            ),
            _buildDetailRow(context, 'Priority:', Text(todo['priority'] as String)),
            _buildDetailRow(
              context,
              'Due Date:',
              Text(DateTimeUtils.formatDate(todo['dueDate'] as DateTime)),
            ),
            _buildDetailRow(
              context,
              'Created:',
              Text(DateTimeUtils.timeAgo(todo['createdAt'] as DateTime)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, Widget value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          value,
        ],
      ),
    );
  }
}
