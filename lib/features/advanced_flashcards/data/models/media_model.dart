import 'package:isar/isar.dart';
import '../../domain/entities/media_entity.dart';
import 'flashcard_model.dart';

part 'media_model.g.dart';

/// Data model for Media entity.
///
/// This model handles data persistence and serialization for Media,
/// providing conversion methods between domain entities and data models.
@Collection()
class MediaModel {

  Id? id = Isar.autoIncrement;

  /// Relationship link to flashcard entity
  final IsarLink<FlashcardModel> flashcard = IsarLink<FlashcardModel>();
  @Index(type: IndexType.hash)
  final String type;
  @Index(type: IndexType.value)
  final String? url;
  @Index(type: IndexType.value)
  final String? description;

  MediaModel({
    this.id,
    required this.type,
    this.url,
    this.description,
  });

  /// Creates a model from an entity.
  factory MediaModel.fromEntity(MediaEntity entity) {
    return MediaModel(
      id: entity.id,
      type: entity.type,
      url: entity.url,
      description: entity.description,
    );
  }

  /// Converts this model to an entity.
  MediaEntity toEntity() {
    return MediaEntity(
      id: id,
      type: type,
      url: url,
      description: description,
    );
  }

}

