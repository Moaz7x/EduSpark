import 'package:isar/isar.dart';
import '../../domain/entities/reminder_entity.dart';
import 'todo_model.dart';

part 'reminder_model.g.dart';

/// Data model for Reminder entity.
///
/// This model handles data persistence and serialization for Reminder,
/// providing conversion methods between domain entities and data models.
@Collection()
class ReminderModel {

  Id? id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String message;
  /// Relationship link to todo entity
  final IsarLink<TodoModel> todo = IsarLink<TodoModel>();
  @Index(type: IndexType.value)
  final DateTime? time;
  @Index(type: IndexType.value)
  final bool? isRecurring;
  @Index(type: IndexType.value)
  final String recurrencePattern;
  @Index(type: IndexType.value)
  final DateTime createdAt;

  ReminderModel({
    this.id,
    required this.message,
    this.time,
    this.isRecurring,
    required this.recurrencePattern,
    required this.createdAt,
  });

  /// Creates a model from an entity.
  factory ReminderModel.fromEntity(ReminderEntity entity) {
    return ReminderModel(
      id: entity.id,
      message: entity.message,
      time: entity.time,
      isRecurring: entity.isRecurring,
      recurrencePattern: entity.recurrencePattern,
      createdAt: entity.createdAt,
    );
  }

  /// Converts this model to an entity.
  ReminderEntity toEntity() {
    return ReminderEntity(
      id: id,
      message: message,
      time: time,
      isRecurring: isRecurring,
      recurrencePattern: recurrencePattern,
      createdAt: createdAt,
    );
  }

}

