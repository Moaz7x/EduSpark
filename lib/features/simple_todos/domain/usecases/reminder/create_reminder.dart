import '../../entities/reminder_entity.dart';
import '../../repositories/reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Reminder entity.
///
/// This use case encapsulates the business logic for creating a Reminder,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, ReminderEntity&gt; for functional error handling.
class CreateReminderUseCase extends BaseUseCase<ReminderEntity, ReminderEntity> {
  final ReminderRepository repository;

  CreateReminderUseCase(this.repository);

  @override
  Future<Either<Failure, ReminderEntity>> call(ReminderEntity params) async {
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
      return Left(UnknownFailure('Failed to create Reminder: ${e.toString()}', e));
    }
  }

  /// Validates the Reminder entity before creation.
  ValidationFailure? _validateEntity(ReminderEntity entity) {
    if (entity.message.isEmpty) {
      return ValidationFailure('message cannot be empty');
    }
    if (entity.time == null) {
      return ValidationFailure('time is required');
    }
    if (entity.isRecurring == null) {
      return ValidationFailure('is ecurring is required');
    }
    if (entity.recurrencePattern.isEmpty) {
      return ValidationFailure('recurrence attern cannot be empty');
    }
    return null; // No validation errors
  }
}

