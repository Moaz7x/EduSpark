import 'package:isar/isar.dart';
import '../../domain/entities/pomodoro_session_entity.dart';
import 'break_session_model.dart';
import 'task_model.dart';

part 'pomodoro_session_model.g.dart';

/// Data model for PomodoroSession entity.
///
/// This model handles data persistence and serialization for PomodoroSession,
/// providing conversion methods between domain entities and data models.
@Collection()
class PomodoroSessionModel {

  Id? id = Isar.autoIncrement;

  /// Relationship link to task entity
  final IsarLink<TaskModel> task = IsarLink<TaskModel>();
  @Index(type: IndexType.value)
  final DateTime? startTime;
  @Index(type: IndexType.value)
  final DateTime? endTime;
  @Index(type: IndexType.value)
  final bool? isCompleted;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;
  @Backlink(to: 'pomodoroSession')
  final IsarLinks<BreakSessionModel> breaksessions = IsarLinks<BreakSessionModel>();

  PomodoroSessionModel({
    this.id,
    this.startTime,
    this.endTime,
    this.isCompleted,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory PomodoroSessionModel.fromEntity(PomodoroSessionEntity entity) {
    return PomodoroSessionModel(
      id: entity.id,
      startTime: entity.startTime,
      endTime: entity.endTime,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  PomodoroSessionEntity toEntity() {
    return PomodoroSessionEntity(
      id: id,
      startTime: startTime,
      endTime: endTime,
      isCompleted: isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
      breaksessions: null, // Relationships handled separately
    );
  }

}

