import 'package:isar/isar.dart';
import '../../domain/entities/user_settings_entity.dart';

part 'user_settings_model.g.dart';

/// Data model for UserSettings entity.
///
/// This model handles data persistence and serialization for UserSettings,
/// providing conversion methods between domain entities and data models.
@Collection()
class UserSettingsModel {

  Id? id = Isar.autoIncrement;

  final int userId;
  @Index(type: IndexType.value)
  final String preferredLanguage;
  @Index(type: IndexType.value)
  final String autoSave;
  @Index(type: IndexType.value)
  final String notificationEnabled;

  UserSettingsModel({
    this.id,
    required this.userId,
    required this.preferredLanguage,
    required this.autoSave,
    required this.notificationEnabled,
  });

  /// Creates a model from an entity.
  factory UserSettingsModel.fromEntity(UserSettingsEntity entity) {
    return UserSettingsModel(
      id: entity.id,
      userId: entity.userId,
      preferredLanguage: entity.preferredLanguage,
      autoSave: entity.autoSave,
      notificationEnabled: entity.notificationEnabled,
    );
  }

  /// Converts this model to an entity.
  UserSettingsEntity toEntity() {
    return UserSettingsEntity(
      id: id,
      userId: userId,
      preferredLanguage: preferredLanguage,
      autoSave: autoSave,
      notificationEnabled: notificationEnabled,
    );
  }

}

