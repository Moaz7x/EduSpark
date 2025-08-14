import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// In a real app, you would import your entities
// import '../../domain/entities/todo_entity.dart';
// import '../../domain/entities/subtask_entity.dart';
// import '../../domain/entities/reminder_entity.dart';

/// Represents the state for the entire TodoDetailScreen.
@immutable
class TodoDetailScreenState {
  // In a real app, these would be AsyncValue<...> to handle loading/error states
  // final AsyncValue<TodoEntity> todo;
  // final AsyncValue<List<SubtaskEntity>> subtasks;
  // final AsyncValue<List<ReminderEntity>> reminders;

  // For the prototype, we use simple lists and maps.
  final Map<String, dynamic>? todo;
  final List<Map<String, dynamic>> subtasks;
  final List<Map<String, dynamic>> reminders;

  final String subtaskSearchQuery;
  final String reminderSearchQuery;

  const TodoDetailScreenState({
    this.todo,
    this.subtasks = const [],
    this.reminders = const [],
    this.subtaskSearchQuery = '',
    this.reminderSearchQuery = '',
  });

  TodoDetailScreenState copyWith({
    Map<String, dynamic>? todo,
    List<Map<String, dynamic>>? subtasks,
    List<Map<String, dynamic>>? reminders,
    String? subtaskSearchQuery,
    String? reminderSearchQuery,
  }) {
    return TodoDetailScreenState(
      todo: todo ?? this.todo,
      subtasks: subtasks ?? this.subtasks,
      reminders: reminders ?? this.reminders,
      subtaskSearchQuery: subtaskSearchQuery ?? this.subtaskSearchQuery,
      reminderSearchQuery: reminderSearchQuery ?? this.reminderSearchQuery,
    );
  }
}

/// Notifier to manage the state for the TodoDetailScreen.
class TodoDetailScreenNotifier extends StateNotifier<TodoDetailScreenState> {
  // In a real app, you would inject use cases here.
  TodoDetailScreenNotifier(int todoId) : super(const TodoDetailScreenState()) {
    // Initialize controllers here.
    subtaskSearchController = TextEditingController();
    reminderSearchController = TextEditingController();

    // Add listeners to update the state.
    subtaskSearchController.addListener(() {
      state = state.copyWith(subtaskSearchQuery: subtaskSearchController.text);
    });
    reminderSearchController.addListener(() {
      state = state.copyWith(reminderSearchQuery: reminderSearchController.text);
    });

    // Fetch the data for the given todoId.
    _fetchTodoDetails(todoId);
  }

  late final TextEditingController subtaskSearchController;
  late final TextEditingController reminderSearchController;

  void _fetchTodoDetails(int todoId) {
    // TODO: Replace this with calls to your use cases to get the
    //       todo, its subtasks, and its reminders by the todoId.

    // --- MOCK DATA FOR PROTOTYPE ---
    final mockTodo = {
      'title': 'Design the new app dashboard',
      'description': 'Create a comprehensive design in Figma...',
      'priority': 'High', 'isCompleted': false,
      'dueDate': DateTime.now().add(const Duration(days: 5)),
      'createdAt': DateTime.now().subtract(const Duration(days: 2)),
    };
    final mockSubtasks = [
      {'id': 101, 'title': 'Create wireframes for user profile', 'isCompleted': true},
      {'id': 102, 'title': 'Design color palette', 'isCompleted': true},
      {'id': 103, 'title': 'Develop prototype in Figma', 'isCompleted': false},
      {'id': 104, 'title': 'User testing session for prototype', 'isCompleted': false},
    ];
    final mockReminders = [
      {'id': 201, 'message': 'Daily Stand-up Reminder', 'time': DateTime.now().add(const Duration(hours: 1))},
      {'id': 202, 'message': 'Follow up with the design team', 'time': DateTime.now().add(const Duration(days: 1))},
    ];

    state = state.copyWith(
      todo: mockTodo,
      subtasks: mockSubtasks,
      reminders: mockReminders,
    );
  }

  @override
  void dispose() {
    subtaskSearchController.dispose();
    reminderSearchController.dispose();
    super.dispose();
  }
}

/// The main provider for the TodoDetailScreen.
/// We use .family to pass the `todoId` to the notifier.
/// This allows us to create a unique provider for each detail screen instance.
final todoDetailScreenProvider =
    StateNotifierProvider.autoDispose.family<TodoDetailScreenNotifier, TodoDetailScreenState, int>(
  (ref, todoId) {
    return TodoDetailScreenNotifier(todoId);
  },
);
