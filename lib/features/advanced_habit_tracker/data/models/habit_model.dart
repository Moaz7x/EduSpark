import 'package:isar/isar.dart';
import '../../domain/entities/habit_entity.dart';

part 'habit_model.g.dart';

/// Data model for Habit entity.
///
/// This model handles data persistence and serialization for Habit,
/// providing conversion methods between domain entities and data models.
@Collection()
class HabitModel {

  Id? id = Isar.autoIncrement;

  final int habitId;
  @Index(type: IndexType.value)
  final String title;
  @Index(type: IndexType.value)
  final String? description;
  @Index(type: IndexType.value)
  final bool? isActive;
  @Index(type: IndexType.hash)
  final String priority;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;
  final int categoryId;

  HabitModel({
    this.id,
    required this.habitId,
    required this.title,
    this.description,
    this.isActive,
    required this.priority,
    required this.createdAt,
    this.updatedAt,
    required this.categoryId,
  });

  /// Creates a model from an entity.
  factory HabitModel.fromEntity(HabitEntity entity) {
    return HabitModel(
      id: entity.id,
      habitId: entity.habitId,
      title: entity.title,
      description: entity.description,
      isActive: entity.isActive,
      priority: entity.priority,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      categoryId: entity.categoryId,
    );
  }

  /// Converts this model to an entity.
  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      habitId: habitId,
      title: title,
      description: description,
      isActive: isActive,
      priority: priority,
      createdAt: createdAt,
      updatedAt: updatedAt,
      categoryId: categoryId,
    );
  }

}

