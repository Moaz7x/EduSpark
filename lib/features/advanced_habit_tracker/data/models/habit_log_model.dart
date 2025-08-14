import 'package:isar/isar.dart';
import '../../domain/entities/habit_log_entity.dart';

part 'habit_log_model.g.dart';

/// Data model for HabitLog entity.
///
/// This model handles data persistence and serialization for HabitLog,
/// providing conversion methods between domain entities and data models.
@Collection()
class HabitLogModel {

  Id? id = Isar.autoIncrement;

  final int logId;
  final int habitId;
  @Index(type: IndexType.value)
  final DateTime? logDate;
  @Index(type: IndexType.value)
  final bool? isCompleted;
  @Index(type: IndexType.value)
  final String notes;

  HabitLogModel({
    this.id,
    required this.logId,
    required this.habitId,
    this.logDate,
    this.isCompleted,
    required this.notes,
  });

  /// Creates a model from an entity.
  factory HabitLogModel.fromEntity(HabitLogEntity entity) {
    return HabitLogModel(
      id: entity.id,
      logId: entity.logId,
      habitId: entity.habitId,
      logDate: entity.logDate,
      isCompleted: entity.isCompleted,
      notes: entity.notes,
    );
  }

  /// Converts this model to an entity.
  HabitLogEntity toEntity() {
    return HabitLogEntity(
      id: id,
      logId: logId,
      habitId: habitId,
      logDate: logDate,
      isCompleted: isCompleted,
      notes: notes,
    );
  }

}

