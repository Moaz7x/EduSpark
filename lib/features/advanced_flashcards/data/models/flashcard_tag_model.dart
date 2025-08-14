import 'package:isar/isar.dart';
import '../../domain/entities/flashcard_tag_entity.dart';
import 'flashcard_model.dart';
import 'tag_model.dart';

part 'flashcard_tag_model.g.dart';

/// Data model for FlashcardTag entity.
///
/// This model handles data persistence and serialization for FlashcardTag,
/// providing conversion methods between domain entities and data models.
@Collection()
class FlashcardTagModel {
  Id? id = Isar.autoIncrement;
  final String? tagName;

  /// Relationship link to flashcard entity
  final IsarLink<FlashcardModel> flashcard = IsarLink<FlashcardModel>();

  /// Relationship link to tag entity
  final IsarLink<TagModel> tag = IsarLink<TagModel>();

  FlashcardTagModel({
    this.id,
    this.tagName
  });

  /// Creates a model from an entity.
  factory FlashcardTagModel.fromEntity(FlashcardTagEntity entity) {
    return FlashcardTagModel(
      id: entity.id,
      tagName: entity.tagName
    );
  }

  /// Converts this model to an entity.
  FlashcardTagEntity toEntity() {
    return FlashcardTagEntity(
      id: id,
      tagName: tagName
    );
  }
}
