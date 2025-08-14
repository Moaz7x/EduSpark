import 'package:equatable/equatable.dart';

/// Reminder entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Reminder,
/// remaining independent of external frameworks and data sources.
class ReminderEntity extends Equatable {
  final int? id;
  final String message;
  final DateTime? time;
  final bool? isRecurring;
  final String recurrencePattern;
  final DateTime createdAt;

  const ReminderEntity({
    this.id,
    required this.message,
    this.time,
    this.isRecurring,
    required this.recurrencePattern,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    message,
    time,
    isRecurring,
    recurrencePattern,
    createdAt,
  ];

  /// Creates a copy of this entity with updated values.
  ReminderEntity copyWith({
    String? message,
    DateTime? time,
    bool? isRecurring,
    String? recurrencePattern,
    DateTime? createdAt,
  }) {
    return ReminderEntity(
      message: message ?? this.message,
      time: time ?? this.time,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

