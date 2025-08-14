import 'package:isar/isar.dart';
import '../../domain/entities/flashcard_entity.dart';
import 'media_model.dart';
import 'review_model.dart';
import 'flashcard_tag_model.dart';
import 'deck_model.dart';

part 'flashcard_model.g.dart';

/// Data model for Flashcard entity.
///
/// This model handles data persistence and serialization for Flashcard,
/// providing conversion methods between domain entities and data models.
@Collection()
class FlashcardModel {

  Id? id = Isar.autoIncrement;

  /// Relationship link to deck entity
  final IsarLink<DeckModel> deck = IsarLink<DeckModel>();
  @Index(type: IndexType.value)
  final String question;
  @Index(type: IndexType.value)
  final String answer;
  @Index(type: IndexType.value)
  final String explanation;
  @Index(type: IndexType.value)
  final bool? isActive;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;
  @Backlink(to: 'flashcard')
  final IsarLinks<MediaModel> medias = IsarLinks<MediaModel>();
  @Backlink(to: 'flashcard')
  final IsarLinks<ReviewModel> reviews = IsarLinks<ReviewModel>();
  @Backlink(to: 'flashcard')
  final IsarLinks<FlashcardTagModel> flashcardtags = IsarLinks<FlashcardTagModel>();

  FlashcardModel({
    this.id,
    required this.question,
    required this.answer,
    required this.explanation,
    this.isActive,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory FlashcardModel.fromEntity(FlashcardEntity entity) {
    return FlashcardModel(
      id: entity.id,
      question: entity.question,
      answer: entity.answer,
      explanation: entity.explanation,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  FlashcardEntity toEntity() {
    return FlashcardEntity(
      id: id,
      question: question,
      answer: answer,
      explanation: explanation,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      medias: null, // Relationships handled separately
      reviews: null, // Relationships handled separately
      flashcardtags: null, // Relationships handled separately
    );
  }

}

