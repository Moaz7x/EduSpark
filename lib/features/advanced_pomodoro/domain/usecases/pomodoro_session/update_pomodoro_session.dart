import '../../entities/pomodoro_session_entity.dart';
import '../../repositories/pomodoro_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing PomodoroSession entity.
///
/// This use case encapsulates the business logic for updating a PomodoroSession,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, PomodoroSessionEntity&gt; for functional error handling.
class UpdatePomodoroSessionUseCase extends BaseUseCase<PomodoroSessionEntity, UpdateParams<PomodoroSessionEntity>> {
  final PomodoroSessionRepository repository;

  UpdatePomodoroSessionUseCase(this.repository);

  @override
  Future<Either<Failure, PomodoroSessionEntity>> call(UpdateParams<PomodoroSessionEntity> params) async {
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
        return Left(ValidationFailure('PomodoroSession with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update PomodoroSession: ${e.toString()}', e));
    }
  }

  /// Validates the PomodoroSession entity before update.
  ValidationFailure? _validateEntity(PomodoroSessionEntity entity) {
    if (entity.startTime == null) {
      return ValidationFailure('start time is required');
    }
    if (entity.endTime == null) {
      return ValidationFailure('end time is required');
    }
    if (entity.isCompleted == null) {
      return ValidationFailure('is completed is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    if (entity.breaksessions == null) {
      return ValidationFailure('breaksessions is required');
    }
    return null; // No validation errors
  }
}

