import 'package:edusparkv4/features/simple_todos/presentation/widgets/forms/add_edit_reminder_form.dart';
import 'package:edusparkv4/features/simple_todos/presentation/widgets/forms/add_edit_subtask_form.dart';
import 'package:edusparkv4/features/simple_todos/presentation/widgets/forms/add_edit_todo_form.dart';
import 'package:flutter/material.dart';

import '../utils/dialog_utils.dart';
import '../utils/modal_bottom_sheet_utils.dart';
import '../widgets/detail_screen/detail_card_widget.dart';
import '../widgets/detail_screen/related_items_section.dart';
import '../widgets/detail_screen/reminder_item_widget.dart';
import '../widgets/detail_screen/subtask_item_widget.dart';

class TodoDetailScreen extends StatefulWidget {
  final int todoId;

  const TodoDetailScreen({super.key, required this.todoId});

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  // ... (All the state and logic from the previous response remains exactly the same)
  final TextEditingController _subtaskSearchController = TextEditingController();
  final TextEditingController _reminderSearchController = TextEditingController();
  String _subtaskSearchQuery = '';
  String _reminderSearchQuery = '';

  final List<Map<String, dynamic>> _allSubtasks = [
    {'id': 101, 'title': 'Create wireframes for user profile', 'isCompleted': true},
    {'id': 102, 'title': 'Design color palette', 'isCompleted': true},
    {'id': 103, 'title': 'Develop prototype in Figma', 'isCompleted': false},
    {'id': 104, 'title': 'User testing session for prototype', 'isCompleted': false},
  ];

  final List<Map<String, dynamic>> _allReminders = [
    {
      'id': 201,
      'message': 'Daily Stand-up Reminder',
      'time': DateTime.now().add(const Duration(hours: 1)),
    },
    {
      'id': 202,
      'message': 'Follow up with the design team',
      'time': DateTime.now().add(const Duration(days: 1)),
    },
  ];

  @override
  void initState() {
    super.initState();
    _subtaskSearchController.addListener(() {
      setState(() {
        _subtaskSearchQuery = _subtaskSearchController.text;
      });
    });
    _reminderSearchController.addListener(() {
      setState(() {
        _reminderSearchQuery = _reminderSearchController.text;
      });
    });
  }

  @override
  void dispose() {
    _subtaskSearchController.dispose();
    _reminderSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredSubtasks = _allSubtasks.where((subtask) {
      return subtask['title'].toString().toLowerCase().contains(_subtaskSearchQuery.toLowerCase());
    }).toList();

    final filteredReminders = _allReminders.where((reminder) {
      return reminder['message'].toString().toLowerCase().contains(
        _reminderSearchQuery.toLowerCase(),
      );
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
                child: const AddEditTodoForm(/* todo: actualTodoObject */),
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
            const DetailCardWidget(),
            const SizedBox(height: 24),
            RelatedItemsSection(
              title: 'Subtasks',
              searchController: _subtaskSearchController,
              itemCount: filteredSubtasks.length,
              onAddItem: () {
                ModalBottomSheetUtils.showAppModalBottomSheet(
                  context: context,
                  title: 'Add New Subtask',
                  child: AddEditSubtaskForm(/* parentTodoId: widget.todoId */),
                );
              },
              itemBuilder: (context, index) {
                return SubtaskItemWidget(subtask: filteredSubtasks[index]);
              },
            ),
            const SizedBox(height: 24),
            RelatedItemsSection(
              title: 'Reminders',
              searchController: _reminderSearchController,
              itemCount: filteredReminders.length,
              onAddItem: () {
                ModalBottomSheetUtils.showAppModalBottomSheet(
                  context: context,
                  title: 'Add New Reminder',
                  child: AddEditReminderForm(/* parentTodoId: widget.todoId */),
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
