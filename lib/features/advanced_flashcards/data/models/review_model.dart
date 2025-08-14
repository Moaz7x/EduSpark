import 'package:isar/isar.dart';
import '../../domain/entities/review_entity.dart';
import 'flashcard_model.dart';

part 'review_model.g.dart';

/// Data model for Review entity.
///
/// This model handles data persistence and serialization for Review,
/// providing conversion methods between domain entities and data models.
@Collection()
class ReviewModel {

  Id? id = Isar.autoIncrement;

  /// Relationship link to flashcard entity
  final IsarLink<FlashcardModel> flashcard = IsarLink<FlashcardModel>();
  @Index(type: IndexType.value)
  final DateTime? reviewDate;
  @Index(type: IndexType.value)
  final bool? isCorrect;
  @Index(type: IndexType.value)
  final DateTime? responseTime;

  ReviewModel({
    this.id,
    this.reviewDate,
    this.isCorrect,
    this.responseTime,
  });

  /// Creates a model from an entity.
  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      id: entity.id,
      reviewDate: entity.reviewDate,
      isCorrect: entity.isCorrect,
      responseTime: entity.responseTime,
    );
  }

  /// Converts this model to an entity.
  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      reviewDate: reviewDate,
      isCorrect: isCorrect,
      responseTime: responseTime,
    );
  }

}

