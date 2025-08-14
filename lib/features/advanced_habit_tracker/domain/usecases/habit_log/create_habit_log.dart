import '../../entities/habit_log_entity.dart';
import '../../repositories/habit_log_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new HabitLog entity.
///
/// This use case encapsulates the business logic for creating a HabitLog,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, HabitLogEntity&gt; for functional error handling.
class CreateHabitLogUseCase extends BaseUseCase<HabitLogEntity, HabitLogEntity> {
  final HabitLogRepository repository;

  CreateHabitLogUseCase(this.repository);

  @override
  Future<Either<Failure, HabitLogEntity>> call(HabitLogEntity params) async {
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
      return Left(UnknownFailure('Failed to create HabitLog: ${e.toString()}', e));
    }
  }

  /// Validates the HabitLog entity before creation.
  ValidationFailure? _validateEntity(HabitLogEntity entity) {
    if (entity.logDate == null) {
      return ValidationFailure('log ate is required');
    }
    if (entity.isCompleted == null) {
      return ValidationFailure('is ompleted is required');
    }
    if (entity.notes.isEmpty) {
      return ValidationFailure('notes cannot be empty');
    }
    return null; // No validation errors
  }
}

