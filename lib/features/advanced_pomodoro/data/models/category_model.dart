import 'package:isar/isar.dart';
import '../../domain/entities/category_entity.dart';
import 'task_model.dart';

part 'category_model.g.dart';

/// Data model for Category entity.
///
/// This model handles data persistence and serialization for Category,
/// providing conversion methods between domain entities and data models.
@Collection()
class CategoryModel {

  Id? id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String name;
  @Index(type: IndexType.value)
  final String? description;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;
  @Backlink(to: 'category')
  final IsarLinks<TaskModel> tasks = IsarLinks<TaskModel>();

  CategoryModel({
    this.id,
    required this.name,
    this.description,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      tasks: null, // Relationships handled separately
    );
  }

}

