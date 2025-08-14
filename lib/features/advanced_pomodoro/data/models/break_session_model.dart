import 'package:isar/isar.dart';
import '../../domain/entities/break_session_entity.dart';
import 'pomodoro_session_model.dart';

part 'break_session_model.g.dart';

/// Data model for BreakSession entity.
///
/// This model handles data persistence and serialization for BreakSession,
/// providing conversion methods between domain entities and data models.
@Collection()
class BreakSessionModel {

  Id? id = Isar.autoIncrement;

  /// Relationship link to pomodoroSession entity
  final IsarLink<PomodoroSessionModel> pomodoroSession = IsarLink<PomodoroSessionModel>();
  @Index(type: IndexType.hash)
  final String type;
  @Index(type: IndexType.value)
  final String duration;
  @Index(type: IndexType.value)
  final String startedAt;
  @Index(type: IndexType.value)
  final String endedAt;

  BreakSessionModel({
    this.id,
    required this.type,
    required this.duration,
    required this.startedAt,
    required this.endedAt,
  });

  /// Creates a model from an entity.
  factory BreakSessionModel.fromEntity(BreakSessionEntity entity) {
    return BreakSessionModel(
      id: entity.id,
      type: entity.type,
      duration: entity.duration,
      startedAt: entity.startedAt,
      endedAt: entity.endedAt,
    );
  }

  /// Converts this model to an entity.
  BreakSessionEntity toEntity() {
    return BreakSessionEntity(
      id: id,
      type: type,
      duration: duration,
      startedAt: startedAt,
      endedAt: endedAt,
    );
  }

}

