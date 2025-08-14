import 'package:isar/isar.dart';
import '../../domain/entities/deck_entity.dart';
import 'flashcard_model.dart';

part 'deck_model.g.dart';

/// Data model for Deck entity.
///
/// This model handles data persistence and serialization for Deck,
/// providing conversion methods between domain entities and data models.
@Collection()
class DeckModel {

  Id? id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String title;
  @Index(type: IndexType.value)
  final String? description;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;
  @Backlink(to: 'deck')
  final IsarLinks<FlashcardModel> flashcards = IsarLinks<FlashcardModel>();

  DeckModel({
    this.id,
    required this.title,
    this.description,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory DeckModel.fromEntity(DeckEntity entity) {
    return DeckModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  DeckEntity toEntity() {
    return DeckEntity(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      flashcards: null, // Relationships handled separately
    );
  }

}

