import 'package:isar/isar.dart';
import '../../domain/entities/habit_reminder_entity.dart';

part 'habit_reminder_model.g.dart';

/// Data model for HabitReminder entity.
///
/// This model handles data persistence and serialization for HabitReminder,
/// providing conversion methods between domain entities and data models.
@Collection()
class HabitReminderModel {

  Id? id = Isar.autoIncrement;

  final int reminderId;
  final int habitId;
  @Index(type: IndexType.value)
  final String message;
  @Index(type: IndexType.value)
  final DateTime? reminderTime;
  @Index(type: IndexType.value)
  final bool? isRecurring;
  @Index(type: IndexType.value)
  final String recurrencePattern;

  HabitReminderModel({
    this.id,
    required this.reminderId,
    required this.habitId,
    required this.message,
    this.reminderTime,
    this.isRecurring,
    required this.recurrencePattern,
  });

  /// Creates a model from an entity.
  factory HabitReminderModel.fromEntity(HabitReminderEntity entity) {
    return HabitReminderModel(
      id: entity.id,
      reminderId: entity.reminderId,
      habitId: entity.habitId,
      message: entity.message,
      reminderTime: entity.reminderTime,
      isRecurring: entity.isRecurring,
      recurrencePattern: entity.recurrencePattern,
    );
  }

  /// Converts this model to an entity.
  HabitReminderEntity toEntity() {
    return HabitReminderEntity(
      id: id,
      reminderId: reminderId,
      habitId: habitId,
      message: message,
      reminderTime: reminderTime,
      isRecurring: isRecurring,
      recurrencePattern: recurrencePattern,
    );
  }

}

