import 'package:equatable/equatable.dart';

/// Media entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for Media,
/// remaining independent of external frameworks and data sources.
class MediaEntity extends Equatable {
  final int? id;
  final String type;
  final String? url;
  final String? description;

  const MediaEntity({
    this.id,
    required this.type,
    this.url,
    this.description,
  });

  @override
  List<Object?> get props => [
    id,
    type,
    url,
    description,
  ];

  /// Creates a copy of this entity with updated values.
  MediaEntity copyWith({
    String? type,
    String? url,
    String? description,
  }) {
    return MediaEntity(
      type: type ?? this.type,
      url: url ?? this.url,
      description: description ?? this.description,
    );
  }
}

