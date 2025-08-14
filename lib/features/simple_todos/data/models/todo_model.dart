import 'package:isar/isar.dart';
import '../../domain/entities/todo_entity.dart';
import 'subtask_model.dart';
import 'reminder_model.dart';

part 'todo_model.g.dart';

/// Data model for Todo entity.
///
/// This model handles data persistence and serialization for Todo,
/// providing conversion methods between domain entities and data models.
@Collection()
class TodoModel {

  Id? id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String title;
  @Index(type: IndexType.value)
  final String? description;
  @Index(type: IndexType.value)
  final bool? isCompleted;
  @Index(type: IndexType.hash)
  final String priority;
  @Index(type: IndexType.value)
  final String order;
  @Index(type: IndexType.value)
  final DateTime? dueDate;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;
  @Backlink(to: 'todo')
  final IsarLinks<SubtaskModel> subtasks = IsarLinks<SubtaskModel>();
  @Backlink(to: 'todo')
  final IsarLinks<ReminderModel> reminders = IsarLinks<ReminderModel>();

  TodoModel({
    this.id,
    required this.title,
    this.description,
    this.isCompleted,
    required this.priority,
    required this.order,
    this.dueDate,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
      priority: entity.priority,
      order: entity.order,
      dueDate: entity.dueDate,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      priority: priority,
      order: order,
      dueDate: dueDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      subtasks: null, // Relationships handled separately
      reminders: null, // Relationships handled separately
    );
  }

}

