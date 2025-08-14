import 'package:equatable/equatable.dart';
import 'media_entity.dart';
import 'review_entity.dart';
import 'flashcard_tag_entity.dart';

/// Flashcard entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Flashcard,
/// remaining independent of external frameworks and data sources.
class FlashcardEntity extends Equatable {
  final int? id;
  final String question;
  final String answer;
  final String explanation;
  final bool? isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<MediaEntity>? medias;
  final List<ReviewEntity>? reviews;
  final List<FlashcardTagEntity>? flashcardtags;

  const FlashcardEntity({
    this.id,
    required this.question,
    required this.answer,
    required this.explanation,
    this.isActive,
    required this.createdAt,
    this.updatedAt,
    this.medias,
    this.reviews,
    this.flashcardtags,
  });

  @override
  List<Object?> get props => [
    id,
    question,
    answer,
    explanation,
    isActive,
    createdAt,
    updatedAt,
    medias,
    reviews,
    flashcardtags,
  ];

  // Relationship methods

  /// Gets all medias for this flashcard
  List<MediaEntity> getMedias() {
    return medias ?? [];
  }

  /// Adds a media to this flashcard
  FlashcardEntity addMediaEntity(MediaEntity media) {
    final updatedMedias = List<MediaEntity>.from(medias ?? [])
      ..add(media);
    return copyWith(medias: updatedMedias);
  }

  /// Removes a media from this flashcard
  FlashcardEntity removeMediaEntity(int mediaId) {
    final updatedMedias = medias?.where((item) => item.id != mediaId).toList();
    return copyWith(medias: updatedMedias);
  }

  /// Gets all reviews for this flashcard
  List<ReviewEntity> getReviews() {
    return reviews ?? [];
  }

  /// Adds a review to this flashcard
  FlashcardEntity addReviewEntity(ReviewEntity review) {
    final updatedReviews = List<ReviewEntity>.from(reviews ?? [])
      ..add(review);
    return copyWith(reviews: updatedReviews);
  }

  /// Removes a review from this flashcard
  FlashcardEntity removeReviewEntity(int reviewId) {
    final updatedReviews = reviews?.where((item) => item.id != reviewId).toList();
    return copyWith(reviews: updatedReviews);
  }

  /// Gets all flashcardtags for this flashcard
  List<FlashcardTagEntity> getFlashcardtags() {
    return flashcardtags ?? [];
  }

  /// Adds a flashcard_tag to this flashcard
  FlashcardEntity addFlashcardTagEntity(FlashcardTagEntity flashcard_tag) {
    final updatedFlashcardtags = List<FlashcardTagEntity>.from(flashcardtags ?? [])
      ..add(flashcard_tag);
    return copyWith(flashcardtags: updatedFlashcardtags);
  }

  /// Removes a flashcard_tag from this flashcard
  FlashcardEntity removeFlashcardTagEntity(int flashcard_tagId) {
    final updatedFlashcardtags = flashcardtags?.where((item) => item.id != flashcard_tagId).toList();
    return copyWith(flashcardtags: updatedFlashcardtags);
  }

  /// Creates a copy of this entity with updated values.
  FlashcardEntity copyWith({
    String? question,
    String? answer,
    String? explanation,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<MediaEntity>? medias,
    List<ReviewEntity>? reviews,
    List<FlashcardTagEntity>? flashcardtags,
  }) {
    return FlashcardEntity(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      explanation: explanation ?? this.explanation,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      medias: medias ?? this.medias,
      reviews: reviews ?? this.reviews,
      flashcardtags: flashcardtags ?? this.flashcardtags,
    );
  }
}

