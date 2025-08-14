import 'package:equatable/equatable.dart';

/// Review entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Review,
/// remaining independent of external frameworks and data sources.
class ReviewEntity extends Equatable {
  final int? id;
  final DateTime? reviewDate;
  final bool? isCorrect;
  final DateTime? responseTime;

  const ReviewEntity({
    this.id,
    this.reviewDate,
    this.isCorrect,
    this.responseTime,
  });

  @override
  List<Object?> get props => [
    id,
    reviewDate,
    isCorrect,
    responseTime,
  ];

  /// Creates a copy of this entity with updated values.
  ReviewEntity copyWith({
    DateTime? reviewDate,
    bool? isCorrect,
    DateTime? responseTime,
  }) {
    return ReviewEntity(
      reviewDate: reviewDate ?? this.reviewDate,
      isCorrect: isCorrect ?? this.isCorrect,
      responseTime: responseTime ?? this.responseTime,
    );
  }
}

