import 'package:equatable/equatable.dart';

/// BreakSession entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for BreakSession,
/// remaining independent of external frameworks and data sources.
class BreakSessionEntity extends Equatable {
  final int? id;
  final String type;
  final String duration;
  final String startedAt;
  final String endedAt;

  const BreakSessionEntity({
    this.id,
    required this.type,
    required this.duration,
    required this.startedAt,
    required this.endedAt,
  });

  @override
  List<Object?> get props => [
    id,
    type,
    duration,
    startedAt,
    endedAt,
  ];

  /// Creates a copy of this entity with updated values.
  BreakSessionEntity copyWith({
    String? type,
    String? duration,
    String? startedAt,
    String? endedAt,
  }) {
    return BreakSessionEntity(
      type: type ?? this.type,
      duration: duration ?? this.duration,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
    );
  }
}

