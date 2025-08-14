import 'package:isar/isar.dart';
import '../../domain/entities/habit_category_entity.dart';

part 'habit_category_model.g.dart';

/// Data model for HabitCategory entity.
///
/// This model handles data persistence and serialization for HabitCategory,
/// providing conversion methods between domain entities and data models.
@Collection()
class HabitCategoryModel {

  Id? id = Isar.autoIncrement;

  final int categoryId;
  @Index(type: IndexType.value)
  final String name;
  @Index(type: IndexType.value)
  final String? description;

  HabitCategoryModel({
    this.id,
    required this.categoryId,
    required this.name,
    this.description,
  });

  /// Creates a model from an entity.
  factory HabitCategoryModel.fromEntity(HabitCategoryEntity entity) {
    return HabitCategoryModel(
      id: entity.id,
      categoryId: entity.categoryId,
      name: entity.name,
      description: entity.description,
    );
  }

  /// Converts this model to an entity.
  HabitCategoryEntity toEntity() {
    return HabitCategoryEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
    );
  }

}

