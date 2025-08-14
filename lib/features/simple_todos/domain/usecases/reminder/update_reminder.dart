import '../../entities/reminder_entity.dart';
import '../../repositories/reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Reminder entity.
///
/// This use case encapsulates the business logic for updating a Reminder,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, ReminderEntity&gt; for functional error handling.
class UpdateReminderUseCase extends BaseUseCase<ReminderEntity, UpdateParams<ReminderEntity>> {
  final ReminderRepository repository;

  UpdateReminderUseCase(this.repository);

  @override
  Future<Either<Failure, ReminderEntity>> call(UpdateParams<ReminderEntity> params) async {
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
        return Left(ValidationFailure('Reminder with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Reminder: ${e.toString()}', e));
    }
  }

  /// Validates the Reminder entity before update.
  ValidationFailure? _validateEntity(ReminderEntity entity) {
    if (entity.message.isEmpty) {
      return ValidationFailure('message cannot be empty');
    }
    if (entity.time == null) {
      return ValidationFailure('time is required');
    }
    if (entity.isRecurring == null) {
      return ValidationFailure('is recurring is required');
    }
    if (entity.recurrencePattern.isEmpty) {
      return ValidationFailure('recurrence pattern cannot be empty');
    }
    return null; // No validation errors
  }
}

