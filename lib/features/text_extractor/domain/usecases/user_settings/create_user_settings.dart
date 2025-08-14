import '../../entities/user_settings_entity.dart';
import '../../repositories/user_settings_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new UserSettings entity.
///
/// This use case encapsulates the business logic for creating a UserSettings,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, UserSettingsEntity&gt; for functional error handling.
class CreateUserSettingsUseCase extends BaseUseCase<UserSettingsEntity, UserSettingsEntity> {
  final UserSettingsRepository repository;

  CreateUserSettingsUseCase(this.repository);

  @override
  Future<Either<Failure, UserSettingsEntity>> call(UserSettingsEntity params) async {
    // Validate entity before creation
    final validationResult = _validateEntity(params);
    if (validationResult != null) {
      return Left(validationResult);
    }

    try {
      final result = await repository.create(params);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to create UserSettings: ${e.toString()}', e));
    }
  }

  /// Validates the UserSettings entity before creation.
  ValidationFailure? _validateEntity(UserSettingsEntity entity) {
    if (entity.preferredLanguage.isEmpty) {
      return ValidationFailure('preferred anguage cannot be empty');
    }
    if (entity.autoSave.isEmpty) {
      return ValidationFailure('auto ave cannot be empty');
    }
    if (entity.notificationEnabled.isEmpty) {
      return ValidationFailure('notification nabled cannot be empty');
    }
    return null; // No validation errors
  }
}

