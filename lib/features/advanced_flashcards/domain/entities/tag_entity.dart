import 'package:equatable/equatable.dart';
import 'flashcard_tag_entity.dart';

/// Tag entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Tag,
/// remaining independent of external frameworks and data sources.
class TagEntity extends Equatable {
  final int? id;
  final String name;
  final List<FlashcardTagEntity>? flashcardtags;

  const TagEntity({
    this.id,
    required this.name,
    this.flashcardtags,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    flashcardtags,
  ];

  // Relationship methods

  /// Gets all flashcardtags for this tag
  List<FlashcardTagEntity> getFlashcardtags() {
    return flashcardtags ?? [];
  }

  /// Adds a flashcard_tag to this tag
  TagEntity addFlashcardTagEntity(FlashcardTagEntity flashcard_tag) {
    final updatedFlashcardtags = List<FlashcardTagEntity>.from(flashcardtags ?? [])
      ..add(flashcard_tag);
    return copyWith(flashcardtags: updatedFlashcardtags);
  }

  /// Removes a flashcard_tag from this tag
  TagEntity removeFlashcardTagEntity(int flashcard_tagId) {
    final updatedFlashcardtags = flashcardtags?.where((item) => item.id != flashcard_tagId).toList();
    return copyWith(flashcardtags: updatedFlashcardtags);
  }

  /// Creates a copy of this entity with updated values.
  TagEntity copyWith({
    String? name,
    List<FlashcardTagEntity>? flashcardtags,
  }) {
    return TagEntity(
      name: name ?? this.name,
      flashcardtags: flashcardtags ?? this.flashcardtags,
    );
  }
}

