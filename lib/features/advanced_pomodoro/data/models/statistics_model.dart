import 'package:isar/isar.dart';
import '../../domain/entities/statistics_entity.dart';

part 'statistics_model.g.dart';

/// Data model for Statistics entity.
///
/// This model handles data persistence and serialization for Statistics,
/// providing conversion methods between domain entities and data models.
@Collection()
class StatisticsModel {

  Id? id = Isar.autoIncrement;

  final int statId;
  @Index(type: IndexType.value)
  final String totalPomodorosCompleted;
  @Index(type: IndexType.value)
  final DateTime? totalFocusTimeMinutes;
  @Index(type: IndexType.value)
  final DateTime? totalBreakTimeMinutes;
  @Index(type: IndexType.value)
  final String lastSessionAt;

  StatisticsModel({
    this.id,
    required this.statId,
    required this.totalPomodorosCompleted,
    this.totalFocusTimeMinutes,
    this.totalBreakTimeMinutes,
    required this.lastSessionAt,
  });

  /// Creates a model from an entity.
  factory StatisticsModel.fromEntity(StatisticsEntity entity) {
    return StatisticsModel(
      id: entity.id,
      statId: entity.statId,
      totalPomodorosCompleted: entity.totalPomodorosCompleted,
      totalFocusTimeMinutes: entity.totalFocusTimeMinutes,
      totalBreakTimeMinutes: entity.totalBreakTimeMinutes,
      lastSessionAt: entity.lastSessionAt,
    );
  }

  /// Converts this model to an entity.
  StatisticsEntity toEntity() {
    return StatisticsEntity(
      id: id,
      statId: statId,
      totalPomodorosCompleted: totalPomodorosCompleted,
      totalFocusTimeMinutes: totalFocusTimeMinutes,
      totalBreakTimeMinutes: totalBreakTimeMinutes,
      lastSessionAt: lastSessionAt,
    );
  }

}

