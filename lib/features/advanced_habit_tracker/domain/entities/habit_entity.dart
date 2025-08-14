import 'package:equatable/equatable.dart';

/// Habit entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Habit,
/// remaining independent of external frameworks and data sources.
class HabitEntity extends Equatable {
  final int? id;
  final int habitId;
  final String title;
  final String? description;
  final bool? isActive;
  final String priority;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int categoryId;

  const HabitEntity({
    this.id,
    required this.habitId,
    required this.title,
    this.description,
    this.isActive,
    required this.priority,
    required this.createdAt,
    this.updatedAt,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [
    id,
    habitId,
    title,
    description,
    isActive,
    priority,
    createdAt,
    updatedAt,
    categoryId,
  ];

  /// Creates a copy of this entity with updated values.
  HabitEntity copyWith({
    int? habitId,
    String? title,
    String? description,
    bool? isActive,
    String? priority,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? categoryId,
  }) {
    return HabitEntity(
      habitId: habitId ?? this.habitId,
      title: title ?? this.title,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}

