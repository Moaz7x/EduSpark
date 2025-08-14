import 'package:equatable/equatable.dart';

/// HabitReminder entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for HabitReminder,
/// remaining independent of external frameworks and data sources.
class HabitReminderEntity extends Equatable {
  final int? id;
  final int reminderId;
  final int habitId;
  final String message;
  final DateTime? reminderTime;
  final bool? isRecurring;
  final String recurrencePattern;

  const HabitReminderEntity({
    this.id,
    required this.reminderId,
    required this.habitId,
    required this.message,
    this.reminderTime,
    this.isRecurring,
    required this.recurrencePattern,
  });

  @override
  List<Object?> get props => [
    id,
    reminderId,
    habitId,
    message,
    reminderTime,
    isRecurring,
    recurrencePattern,
  ];

  /// Creates a copy of this entity with updated values.
  HabitReminderEntity copyWith({
    int? reminderId,
    int? habitId,
    String? message,
    DateTime? reminderTime,
    bool? isRecurring,
    String? recurrencePattern,
  }) {
    return HabitReminderEntity(
      reminderId: reminderId ?? this.reminderId,
      habitId: habitId ?? this.habitId,
      message: message ?? this.message,
      reminderTime: reminderTime ?? this.reminderTime,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
    );
  }
}

