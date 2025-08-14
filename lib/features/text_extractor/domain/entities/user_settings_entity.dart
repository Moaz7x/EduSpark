import 'package:equatable/equatable.dart';

/// UserSettings entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for UserSettings,
/// remaining independent of external frameworks and data sources.
class UserSettingsEntity extends Equatable {
  final int? id;
  final int userId;
  final String preferredLanguage;
  final String autoSave;
  final String notificationEnabled;

  const UserSettingsEntity({
    this.id,
    required this.userId,
    required this.preferredLanguage,
    required this.autoSave,
    required this.notificationEnabled,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    preferredLanguage,
    autoSave,
    notificationEnabled,
  ];

  /// Creates a copy of this entity with updated values.
  UserSettingsEntity copyWith({
    int? userId,
    String? preferredLanguage,
    String? autoSave,
    String? notificationEnabled,
  }) {
    return UserSettingsEntity(
      userId: userId ?? this.userId,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      autoSave: autoSave ?? this.autoSave,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
    );
  }
}

