import 'package:equatable/equatable.dart';
import 'pomodoro_session_entity.dart';

/// Task entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Task,
/// remaining independent of external frameworks and data sources.
class TaskEntity extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final bool? isCompleted;
  final String priority;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<PomodoroSessionEntity>? pomodorosessions;

  const TaskEntity({
    this.id,
    required this.title,
    this.description,
    this.isCompleted,
    required this.priority,
    this.dueDate,
    required this.createdAt,
    this.updatedAt,
    this.pomodorosessions,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    isCompleted,
    priority,
    dueDate,
    createdAt,
    updatedAt,
    pomodorosessions,
  ];

  // Relationship methods

  /// Gets all pomodorosessions for this task
  List<PomodoroSessionEntity> getPomodorosessions() {
    return pomodorosessions ?? [];
  }

  /// Adds a pomodoro_session to this task
  TaskEntity addPomodoroSessionEntity(PomodoroSessionEntity pomodoro_session) {
    final updatedPomodorosessions = List<PomodoroSessionEntity>.from(pomodorosessions ?? [])
      ..add(pomodoro_session);
    return copyWith(pomodorosessions: updatedPomodorosessions);
  }

  /// Removes a pomodoro_session from this task
  TaskEntity removePomodoroSessionEntity(int pomodoro_sessionId) {
    final updatedPomodorosessions = pomodorosessions?.where((item) => item.id != pomodoro_sessionId).toList();
    return copyWith(pomodorosessions: updatedPomodorosessions);
  }

  /// Creates a copy of this entity with updated values.
  TaskEntity copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    String? priority,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<PomodoroSessionEntity>? pomodorosessions,
  }) {
    return TaskEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pomodorosessions: pomodorosessions ?? this.pomodorosessions,
    );
  }
}

