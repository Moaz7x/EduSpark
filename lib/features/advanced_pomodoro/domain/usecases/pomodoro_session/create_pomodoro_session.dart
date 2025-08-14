import '../../entities/pomodoro_session_entity.dart';
import '../../repositories/pomodoro_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new PomodoroSession entity.
///
/// This use case encapsulates the business logic for creating a PomodoroSession,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, PomodoroSessionEntity&gt; for functional error handling.
class CreatePomodoroSessionUseCase extends BaseUseCase<PomodoroSessionEntity, PomodoroSessionEntity> {
  final PomodoroSessionRepository repository;

  CreatePomodoroSessionUseCase(this.repository);

  @override
  Future<Either<Failure, PomodoroSessionEntity>> call(PomodoroSessionEntity params) async {
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
      return Left(UnknownFailure('Failed to create PomodoroSession: ${e.toString()}', e));
    }
  }

  /// Validates the PomodoroSession entity before creation.
  ValidationFailure? _validateEntity(PomodoroSessionEntity entity) {
    if (entity.startTime == null) {
      return ValidationFailure('start ime is required');
    }
    if (entity.endTime == null) {
      return ValidationFailure('end ime is required');
    }
    if (entity.isCompleted == null) {
      return ValidationFailure('is ompleted is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
    }
    if (entity.breaksessions == null) {
      return ValidationFailure('breaksessions is required');
    }
    return null; // No validation errors
  }
}

