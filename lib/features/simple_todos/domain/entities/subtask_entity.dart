import 'package:equatable/equatable.dart';

/// Subtask entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Subtask,
/// remaining independent of external frameworks and data sources.
class SubtaskEntity extends Equatable {
  final int? id;
  final String title;
  final bool? isCompleted;
  final String order;
  final String estimatedMinutes;
  final String notes;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const SubtaskEntity({
    this.id,
    required this.title,
    this.isCompleted,
    required this.order,
    required this.estimatedMinutes,
    required this.notes,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    isCompleted,
    order,
    estimatedMinutes,
    notes,
    createdAt,
    updatedAt,
  ];

  /// Creates a copy of this entity with updated values.
  SubtaskEntity copyWith({
    String? title,
    bool? isCompleted,
    String? order,
    String? estimatedMinutes,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SubtaskEntity(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      order: order ?? this.order,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

