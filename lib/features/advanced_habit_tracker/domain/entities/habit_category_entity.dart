import 'package:equatable/equatable.dart';

/// HabitCategory entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for HabitCategory,
/// remaining independent of external frameworks and data sources.
class HabitCategoryEntity extends Equatable {
  final int? id;
  final int categoryId;
  final String name;
  final String? description;

  const HabitCategoryEntity({
    this.id,
    required this.categoryId,
    required this.name,
    this.description,
  });

  @override
  List<Object?> get props => [
    id,
    categoryId,
    name,
    description,
  ];

  /// Creates a copy of this entity with updated values.
  HabitCategoryEntity copyWith({
    int? categoryId,
    String? name,
    String? description,
  }) {
    return HabitCategoryEntity(
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

