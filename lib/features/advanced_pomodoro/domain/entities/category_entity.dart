import 'package:equatable/equatable.dart';
import 'task_entity.dart';

/// Category entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Category,
/// remaining independent of external frameworks and data sources.
class CategoryEntity extends Equatable {
  final int? id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<TaskEntity>? tasks;

  const CategoryEntity({
    this.id,
    required this.name,
    this.description,
    required this.createdAt,
    this.updatedAt,
    this.tasks,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    createdAt,
    updatedAt,
    tasks,
  ];

  // Relationship methods

  /// Gets all tasks for this category
  List<TaskEntity> getTasks() {
    return tasks ?? [];
  }

  /// Adds a task to this category
  CategoryEntity addTaskEntity(TaskEntity task) {
    final updatedTasks = List<TaskEntity>.from(tasks ?? [])
      ..add(task);
    return copyWith(tasks: updatedTasks);
  }

  /// Removes a task from this category
  CategoryEntity removeTaskEntity(int taskId) {
    final updatedTasks = tasks?.where((item) => item.id != taskId).toList();
    return copyWith(tasks: updatedTasks);
  }

  /// Creates a copy of this entity with updated values.
  CategoryEntity copyWith({
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<TaskEntity>? tasks,
  }) {
    return CategoryEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tasks: tasks ?? this.tasks,
    );
  }
}

