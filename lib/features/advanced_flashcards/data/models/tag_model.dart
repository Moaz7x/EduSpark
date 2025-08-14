import 'package:isar/isar.dart';
import '../../domain/entities/tag_entity.dart';
import 'flashcard_tag_model.dart';

part 'tag_model.g.dart';

/// Data model for Tag entity.
///
/// This model handles data persistence and serialization for Tag,
/// providing conversion methods between domain entities and data models.
@Collection()
class TagModel {

  Id? id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String name;
  @Backlink(to: 'tag')
  final IsarLinks<FlashcardTagModel> flashcardtags = IsarLinks<FlashcardTagModel>();

  TagModel({
    this.id,
    required this.name,
  });

  /// Creates a model from an entity.
  factory TagModel.fromEntity(TagEntity entity) {
    return TagModel(
      id: entity.id,
      name: entity.name,
    );
  }

  /// Converts this model to an entity.
  TagEntity toEntity() {
    return TagEntity(
      id: id,
      name: name,
      flashcardtags: null, // Relationships handled separately
    );
  }

}

