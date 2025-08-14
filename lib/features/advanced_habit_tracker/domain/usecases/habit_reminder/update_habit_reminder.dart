import '../../entities/habit_reminder_entity.dart';
import '../../repositories/habit_reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing HabitReminder entity.
///
/// This use case encapsulates the business logic for updating a HabitReminder,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, HabitReminderEntity&gt; for functional error handling.
class UpdateHabitReminderUseCase extends BaseUseCase<HabitReminderEntity, UpdateParams<HabitReminderEntity>> {
  final HabitReminderRepository repository;

  UpdateHabitReminderUseCase(this.repository);

  @override
  Future<Either<Failure, HabitReminderEntity>> call(UpdateParams<HabitReminderEntity> params) async {
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
        return Left(ValidationFailure('HabitReminder with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update HabitReminder: ${e.toString()}', e));
    }
  }

  /// Validates the HabitReminder entity before update.
  ValidationFailure? _validateEntity(HabitReminderEntity entity) {
    if (entity.message.isEmpty) {
      return ValidationFailure('message cannot be empty');
    }
    if (entity.reminderTime == null) {
      return ValidationFailure('reminder time is required');
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

