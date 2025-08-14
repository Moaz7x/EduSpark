import 'package:equatable/equatable.dart';
import 'subtask_entity.dart';
import 'reminder_entity.dart';

/// Todo entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Todo,
/// remaining independent of external frameworks and data sources.
class TodoEntity extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final bool? isCompleted;
  final String priority;
  final String order;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<SubtaskEntity>? subtasks;
  final List<ReminderEntity>? reminders;

  const TodoEntity({
    this.id,
    required this.title,
    this.description,
    this.isCompleted,
    required this.priority,
    required this.order,
    this.dueDate,
    required this.createdAt,
    this.updatedAt,
    this.subtasks,
    this.reminders,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    isCompleted,
    priority,
    order,
    dueDate,
    createdAt,
    updatedAt,
    subtasks,
    reminders,
  ];

  // Relationship methods

  /// Gets all subtasks for this todo
  List<SubtaskEntity> getSubtasks() {
    return subtasks ?? [];
  }

  /// Adds a subtask to this todo
  TodoEntity addSubtaskEntity(SubtaskEntity subtask) {
    final updatedSubtasks = List<SubtaskEntity>.from(subtasks ?? [])
      ..add(subtask);
    return copyWith(subtasks: updatedSubtasks);
  }

  /// Removes a subtask from this todo
  TodoEntity removeSubtaskEntity(int subtaskId) {
    final updatedSubtasks = subtasks?.where((item) => item.id != subtaskId).toList();
    return copyWith(subtasks: updatedSubtasks);
  }

  /// Gets all reminders for this todo
  List<ReminderEntity> getReminders() {
    return reminders ?? [];
  }

  /// Adds a reminder to this todo
  TodoEntity addReminderEntity(ReminderEntity reminder) {
    final updatedReminders = List<ReminderEntity>.from(reminders ?? [])
      ..add(reminder);
    return copyWith(reminders: updatedReminders);
  }

  /// Removes a reminder from this todo
  TodoEntity removeReminderEntity(int reminderId) {
    final updatedReminders = reminders?.where((item) => item.id != reminderId).toList();
    return copyWith(reminders: updatedReminders);
  }

  /// Creates a copy of this entity with updated values.
  TodoEntity copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    String? priority,
    String? order,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<SubtaskEntity>? subtasks,
    List<ReminderEntity>? reminders,
  }) {
    return TodoEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      order: order ?? this.order,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      subtasks: subtasks ?? this.subtasks,
      reminders: reminders ?? this.reminders,
    );
  }
}

