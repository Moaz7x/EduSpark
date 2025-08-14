import 'package:equatable/equatable.dart';

/// Statistics entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Statistics,
/// remaining independent of external frameworks and data sources.
class StatisticsEntity extends Equatable {
  final int? id;
  final int statId;
  final String totalPomodorosCompleted;
  final DateTime? totalFocusTimeMinutes;
  final DateTime? totalBreakTimeMinutes;
  final String lastSessionAt;

  const StatisticsEntity({
    this.id,
    required this.statId,
    required this.totalPomodorosCompleted,
    this.totalFocusTimeMinutes,
    this.totalBreakTimeMinutes,
    required this.lastSessionAt,
  });

  @override
  List<Object?> get props => [
    id,
    statId,
    totalPomodorosCompleted,
    totalFocusTimeMinutes,
    totalBreakTimeMinutes,
    lastSessionAt,
  ];

  /// Creates a copy of this entity with updated values.
  StatisticsEntity copyWith({
    int? statId,
    String? totalPomodorosCompleted,
    DateTime? totalFocusTimeMinutes,
    DateTime? totalBreakTimeMinutes,
    String? lastSessionAt,
  }) {
    return StatisticsEntity(
      statId: statId ?? this.statId,
      totalPomodorosCompleted: totalPomodorosCompleted ?? this.totalPomodorosCompleted,
      totalFocusTimeMinutes: totalFocusTimeMinutes ?? this.totalFocusTimeMinutes,
      totalBreakTimeMinutes: totalBreakTimeMinutes ?? this.totalBreakTimeMinutes,
      lastSessionAt: lastSessionAt ?? this.lastSessionAt,
    );
  }
}

