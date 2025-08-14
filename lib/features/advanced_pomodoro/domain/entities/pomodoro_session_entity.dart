import 'package:equatable/equatable.dart';
import 'break_session_entity.dart';

/// PomodoroSession entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for PomodoroSession,
/// remaining independent of external frameworks and data sources.
class PomodoroSessionEntity extends Equatable {
  final int? id;
  final DateTime? startTime;
  final DateTime? endTime;
  final bool? isCompleted;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<BreakSessionEntity>? breaksessions;

  const PomodoroSessionEntity({
    this.id,
    this.startTime,
    this.endTime,
    this.isCompleted,
    required this.createdAt,
    this.updatedAt,
    this.breaksessions,
  });

  @override
  List<Object?> get props => [
    id,
    startTime,
    endTime,
    isCompleted,
    createdAt,
    updatedAt,
    breaksessions,
  ];

  // Relationship methods

  /// Gets all breaksessions for this pomodorosession
  List<BreakSessionEntity> getBreaksessions() {
    return breaksessions ?? [];
  }

  /// Adds a break_session to this pomodorosession
  PomodoroSessionEntity addBreakSessionEntity(BreakSessionEntity break_session) {
    final updatedBreaksessions = List<BreakSessionEntity>.from(breaksessions ?? [])
      ..add(break_session);
    return copyWith(breaksessions: updatedBreaksessions);
  }

  /// Removes a break_session from this pomodorosession
  PomodoroSessionEntity removeBreakSessionEntity(int break_sessionId) {
    final updatedBreaksessions = breaksessions?.where((item) => item.id != break_sessionId).toList();
    return copyWith(breaksessions: updatedBreaksessions);
  }

  /// Creates a copy of this entity with updated values.
  PomodoroSessionEntity copyWith({
    DateTime? startTime,
    DateTime? endTime,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<BreakSessionEntity>? breaksessions,
  }) {
    return PomodoroSessionEntity(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      breaksessions: breaksessions ?? this.breaksessions,
    );
  }
}

