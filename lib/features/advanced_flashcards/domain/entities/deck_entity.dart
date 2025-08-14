import 'package:equatable/equatable.dart';
import 'flashcard_entity.dart';

/// Deck entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Deck,
/// remaining independent of external frameworks and data sources.
class DeckEntity extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<FlashcardEntity>? flashcards;

  const DeckEntity({
    this.id,
    required this.title,
    this.description,
    required this.createdAt,
    this.updatedAt,
    this.flashcards,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    createdAt,
    updatedAt,
    flashcards,
  ];

  // Relationship methods

  /// Gets all flashcards for this deck
  List<FlashcardEntity> getFlashcards() {
    return flashcards ?? [];
  }

  /// Adds a flashcard to this deck
  DeckEntity addFlashcardEntity(FlashcardEntity flashcard) {
    final updatedFlashcards = List<FlashcardEntity>.from(flashcards ?? [])
      ..add(flashcard);
    return copyWith(flashcards: updatedFlashcards);
  }

  /// Removes a flashcard from this deck
  DeckEntity removeFlashcardEntity(int flashcardId) {
    final updatedFlashcards = flashcards?.where((item) => item.id != flashcardId).toList();
    return copyWith(flashcards: updatedFlashcards);
  }

  /// Creates a copy of this entity with updated values.
  DeckEntity copyWith({
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<FlashcardEntity>? flashcards,
  }) {
    return DeckEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      flashcards: flashcards ?? this.flashcards,
    );
  }
}

