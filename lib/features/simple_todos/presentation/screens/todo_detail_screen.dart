import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_detail_screen_provider.dart';
import '../utils/dialog_utils.dart';
import '../utils/modal_bottom_sheet_utils.dart';
import '../widgets/detail_screen/detail_card_widget.dart';
import '../widgets/detail_screen/related_items_section.dart';
import '../widgets/detail_screen/reminder_item_widget.dart';
import '../widgets/detail_screen/subtask_item_widget.dart';
import '../widgets/forms/add_edit_reminder_form.dart';
import '../widgets/forms/add_edit_subtask_form.dart';
import '../widgets/forms/add_edit_todo_form.dart';

/// The main detail screen, now a stateless ConsumerWidget.
/// It gets all its data and state from the `todoDetailScreenProvider`.
class TodoDetailScreen extends ConsumerWidget {
  final int todoId;

  const TodoDetailScreen({super.key, required this.todoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider family, passing in the todoId.
    final screenState = ref.watch(todoDetailScreenProvider(todoId));
    final screenNotifier = ref.read(todoDetailScreenProvider(todoId).notifier);

    // Apply search filters locally.
    final filteredSubtasks = screenState.subtasks.where((subtask) {
      return subtask['title'].toString().toLowerCase().contains(screenState.subtaskSearchQuery.toLowerCase());
    }).toList();

    final filteredReminders = screenState.reminders.where((reminder) {
      return reminder['message'].toString().toLowerCase().contains(screenState.reminderSearchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              ModalBottomSheetUtils.showAppModalBottomSheet(
                context: context,
                title: 'Edit Todo',
                child: const AddEditTodoForm(/* todo: screenState.todo */),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              DialogUtils.showConfirmationDialog(
                context: context,
                title: 'Delete Todo',
                content: const Text(
                  'Are you sure you want to delete this todo and all its subtasks and reminders?',
                ),
                isDestructive: true,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // In a real app, you would pass screenState.todo here
            const DetailCardWidget(),
            const SizedBox(height: 24),
            RelatedItemsSection(
              title: 'Subtasks',
              searchController: screenNotifier.subtaskSearchController,
              itemCount: filteredSubtasks.length,
              onAddItem: () {
                ModalBottomSheetUtils.showAppModalBottomSheet(
                  context: context,
                  title: 'Add New Subtask',
                  child: AddEditSubtaskForm(/* parentTodoId: todoId */),
                );
              },
              itemBuilder: (context, index) {
                return SubtaskItemWidget(subtask: filteredSubtasks[index]);
              },
            ),
            const SizedBox(height: 24),
            RelatedItemsSection(
              title: 'Reminders',
              searchController: screenNotifier.reminderSearchController,
              itemCount: filteredReminders.length,
              onAddItem: () {
                ModalBottomSheetUtils.showAppModalBottomSheet(
                  context: context,
                  title: 'Add New Reminder',
                  child: AddEditReminderForm(/* parentTodoId: todoId */),
                );
              },
              itemBuilder: (context, index) {
                return ReminderItemWidget(reminder: filteredReminders[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
