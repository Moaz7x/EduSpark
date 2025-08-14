import 'package:equatable/equatable.dart';

/// ExtractedText entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for ExtractedText,
/// remaining independent of external frameworks and data sources.
class ExtractedTextEntity extends Equatable {
  final int? id;
  final int textId;
  final String textContent;
  final String language;
  final bool? isReviewed;
  final bool? isApproved;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const ExtractedTextEntity({
    this.id,
    required this.textId,
    required this.textContent,
    required this.language,
    this.isReviewed,
    this.isApproved,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    textId,
    textContent,
    language,
    isReviewed,
    isApproved,
    createdAt,
    updatedAt,
  ];

  /// Creates a copy of this entity with updated values.
  ExtractedTextEntity copyWith({
    int? textId,
    String? textContent,
    String? language,
    bool? isReviewed,
    bool? isApproved,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ExtractedTextEntity(
      textId: textId ?? this.textId,
      textContent: textContent ?? this.textContent,
      language: language ?? this.language,
      isReviewed: isReviewed ?? this.isReviewed,
      isApproved: isApproved ?? this.isApproved,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

