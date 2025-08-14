import 'package:isar/isar.dart';
import '../../domain/entities/task_entity.dart';
import 'pomodoro_session_model.dart';
import 'category_model.dart';

part 'task_model.g.dart';

/// Data model for Task entity.
///
/// This model handles data persistence and serialization for Task,
/// providing conversion methods between domain entities and data models.
@Collection()
class TaskModel {

  Id? id = Isar.autoIncrement;

  /// Relationship link to category entity
  final IsarLink<CategoryModel> category = IsarLink<CategoryModel>();
  @Index(type: IndexType.value)
  final String title;
  @Index(type: IndexType.value)
  final String? description;
  @Index(type: IndexType.value)
  final bool? isCompleted;
  @Index(type: IndexType.hash)
  final String priority;
  @Index(type: IndexType.value)
  final DateTime? dueDate;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;
  @Backlink(to: 'task')
  final IsarLinks<PomodoroSessionModel> pomodorosessions = IsarLinks<PomodoroSessionModel>();

  TaskModel({
    this.id,
    required this.title,
    this.description,
    this.isCompleted,
    required this.priority,
    this.dueDate,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted,
      priority: entity.priority,
      dueDate: entity.dueDate,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      priority: priority,
      dueDate: dueDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      pomodorosessions: null, // Relationships handled separately
    );
  }

}

