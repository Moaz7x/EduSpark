import 'package:equatable/equatable.dart';

/// FlashcardTag entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for FlashcardTag,
/// remaining independent of external frameworks and data sources.
class FlashcardTagEntity extends Equatable {
  final int? id;
  final String? tagName;
  const FlashcardTagEntity({
    this.id,
    this.tagName
  });

  @override
  List<Object?> get props => [
    id,
    tagName
  ];

  /// Creates a copy of this entity with updated values.
  FlashcardTagEntity copyWith({
    String? tagName
  }) {
    return FlashcardTagEntity(
      tagName: tagName ?? this.tagName
    );
  }
}

