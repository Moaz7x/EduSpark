import 'package:flutter/material.dart';

/// A generic list view to display items for any tab (Todos, Subtasks, Reminders).
class GenericListView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final String emptyMessage;

  const GenericListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.emptyMessage = "No items found.",
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with a Consumer widget to watch the relevant provider
    // and handle loading/error states.

    if (itemCount == 0) {
      return Center(
        child: Text(
          emptyMessage,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(itemCount: itemCount, itemBuilder: itemBuilder);
  }
}
