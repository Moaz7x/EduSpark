import '../../entities/habit_reminder_entity.dart';
import '../../repositories/habit_reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new HabitReminder entity.
///
/// This use case encapsulates the business logic for creating a HabitReminder,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, HabitReminderEntity&gt; for functional error handling.
class CreateHabitReminderUseCase extends BaseUseCase<HabitReminderEntity, HabitReminderEntity> {
  final HabitReminderRepository repository;

  CreateHabitReminderUseCase(this.repository);

  @override
  Future<Either<Failure, HabitReminderEntity>> call(HabitReminderEntity params) async {
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
      return Left(UnknownFailure('Failed to create HabitReminder: ${e.toString()}', e));
    }
  }

  /// Validates the HabitReminder entity before creation.
  ValidationFailure? _validateEntity(HabitReminderEntity entity) {
    if (entity.message.isEmpty) {
      return ValidationFailure('message cannot be empty');
    }
    if (entity.reminderTime == null) {
      return ValidationFailure('reminder ime is required');
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

