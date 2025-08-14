import 'package:isar/isar.dart';
import '../../domain/entities/subtask_entity.dart';
import 'todo_model.dart';

part 'subtask_model.g.dart';

/// Data model for Subtask entity.
///
/// This model handles data persistence and serialization for Subtask,
/// providing conversion methods between domain entities and data models.
@Collection()
class SubtaskModel {

  Id? id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String title;
  @Index(type: IndexType.value)
  final bool? isCompleted;
  /// Relationship link to todo entity
  final IsarLink<TodoModel> todo = IsarLink<TodoModel>();
  @Index(type: IndexType.value)
  final String order;
  @Index(type: IndexType.value)
  final String estimatedMinutes;
  @Index(type: IndexType.value)
  final String notes;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;

  SubtaskModel({
    this.id,
    required this.title,
    this.isCompleted,
    required this.order,
    required this.estimatedMinutes,
    required this.notes,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory SubtaskModel.fromEntity(SubtaskEntity entity) {
    return SubtaskModel(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
      order: entity.order,
      estimatedMinutes: entity.estimatedMinutes,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  SubtaskEntity toEntity() {
    return SubtaskEntity(
      id: id,
      title: title,
      isCompleted: isCompleted,
      order: order,
      estimatedMinutes: estimatedMinutes,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

}

