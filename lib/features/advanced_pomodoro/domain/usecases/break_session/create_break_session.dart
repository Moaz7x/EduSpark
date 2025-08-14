import '../../entities/break_session_entity.dart';
import '../../repositories/break_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new BreakSession entity.
///
/// This use case encapsulates the business logic for creating a BreakSession,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, BreakSessionEntity&gt; for functional error handling.
class CreateBreakSessionUseCase extends BaseUseCase<BreakSessionEntity, BreakSessionEntity> {
  final BreakSessionRepository repository;

  CreateBreakSessionUseCase(this.repository);

  @override
  Future<Either<Failure, BreakSessionEntity>> call(BreakSessionEntity params) async {
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
      return Left(UnknownFailure('Failed to create BreakSession: ${e.toString()}', e));
    }
  }

  /// Validates the BreakSession entity before creation.
  ValidationFailure? _validateEntity(BreakSessionEntity entity) {
    if (entity.type.isEmpty) {
      return ValidationFailure('type cannot be empty');
    }
    if (entity.duration.isEmpty) {
      return ValidationFailure('duration cannot be empty');
    }
    if (entity.startedAt.isEmpty) {
      return ValidationFailure('started t cannot be empty');
    }
    if (entity.endedAt.isEmpty) {
      return ValidationFailure('ended t cannot be empty');
    }
    return null; // No validation errors
  }
}

