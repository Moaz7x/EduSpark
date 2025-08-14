import '../../entities/user_settings_entity.dart';
import '../../repositories/user_settings_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing UserSettings entity.
///
/// This use case encapsulates the business logic for updating a UserSettings,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, UserSettingsEntity&gt; for functional error handling.
class UpdateUserSettingsUseCase extends BaseUseCase<UserSettingsEntity, UpdateParams<UserSettingsEntity>> {
  final UserSettingsRepository repository;

  UpdateUserSettingsUseCase(this.repository);

  @override
  Future<Either<Failure, UserSettingsEntity>> call(UpdateParams<UserSettingsEntity> params) async {
    // Validate the ID parameter
    if (params.id <= 0) {
      return Left(ValidationFailure('ID must be greater than 0 for update operation'));
    }

    // Validate entity fields
    final validationResult = _validateEntity(params.entity);
    if (validationResult != null) {
      return Left(validationResult);
    }

    try {
      // Check if entity exists before updating
      final existsResult = await repository.exists(params.id);
      final exists = existsResult.fold(
        (failure) => false,
        (exists) => exists,
      );
      if (!exists) {
        return Left(ValidationFailure('UserSettings with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update UserSettings: ${e.toString()}', e));
    }
  }

  /// Validates the UserSettings entity before update.
  ValidationFailure? _validateEntity(UserSettingsEntity entity) {
    if (entity.preferredLanguage.isEmpty) {
      return ValidationFailure('preferred language cannot be empty');
    }
    if (entity.autoSave.isEmpty) {
      return ValidationFailure('auto save cannot be empty');
    }
    if (entity.notificationEnabled.isEmpty) {
      return ValidationFailure('notification enabled cannot be empty');
    }
    return null; // No validation errors
  }
}

