import '../../entities/habit_log_entity.dart';
import '../../repositories/habit_log_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing HabitLog entity.
///
/// This use case encapsulates the business logic for updating a HabitLog,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, HabitLogEntity&gt; for functional error handling.
class UpdateHabitLogUseCase extends BaseUseCase<HabitLogEntity, UpdateParams<HabitLogEntity>> {
  final HabitLogRepository repository;

  UpdateHabitLogUseCase(this.repository);

  @override
  Future<Either<Failure, HabitLogEntity>> call(UpdateParams<HabitLogEntity> params) async {
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
        return Left(ValidationFailure('HabitLog with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update HabitLog: ${e.toString()}', e));
    }
  }

  /// Validates the HabitLog entity before update.
  ValidationFailure? _validateEntity(HabitLogEntity entity) {
    if (entity.logDate == null) {
      return ValidationFailure('log date is required');
    }
    if (entity.isCompleted == null) {
      return ValidationFailure('is completed is required');
    }
    if (entity.notes.isEmpty) {
      return ValidationFailure('notes cannot be empty');
    }
    return null; // No validation errors
  }
}

