import 'package:equatable/equatable.dart';

/// HabitLog entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for HabitLog,
/// remaining independent of external frameworks and data sources.
class HabitLogEntity extends Equatable {
  final int? id;
  final int logId;
  final int habitId;
  final DateTime? logDate;
  final bool? isCompleted;
  final String notes;

  const HabitLogEntity({
    this.id,
    required this.logId,
    required this.habitId,
    this.logDate,
    this.isCompleted,
    required this.notes,
  });

  @override
  List<Object?> get props => [
    id,
    logId,
    habitId,
    logDate,
    isCompleted,
    notes,
  ];

  /// Creates a copy of this entity with updated values.
  HabitLogEntity copyWith({
    int? logId,
    int? habitId,
    DateTime? logDate,
    bool? isCompleted,
    String? notes,
  }) {
    return HabitLogEntity(
      logId: logId ?? this.logId,
      habitId: habitId ?? this.habitId,
      logDate: logDate ?? this.logDate,
      isCompleted: isCompleted ?? this.isCompleted,
      notes: notes ?? this.notes,
    );
  }
}

