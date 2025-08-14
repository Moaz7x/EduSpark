import '../../entities/break_session_entity.dart';
import '../../repositories/break_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing BreakSession entity.
///
/// This use case encapsulates the business logic for updating a BreakSession,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, BreakSessionEntity&gt; for functional error handling.
class UpdateBreakSessionUseCase extends BaseUseCase<BreakSessionEntity, UpdateParams<BreakSessionEntity>> {
  final BreakSessionRepository repository;

  UpdateBreakSessionUseCase(this.repository);

  @override
  Future<Either<Failure, BreakSessionEntity>> call(UpdateParams<BreakSessionEntity> params) async {
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
        return Left(ValidationFailure('BreakSession with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update BreakSession: ${e.toString()}', e));
    }
  }

  /// Validates the BreakSession entity before update.
  ValidationFailure? _validateEntity(BreakSessionEntity entity) {
    if (entity.type.isEmpty) {
      return ValidationFailure('type cannot be empty');
    }
    if (entity.duration.isEmpty) {
      return ValidationFailure('duration cannot be empty');
    }
    if (entity.startedAt.isEmpty) {
      return ValidationFailure('started at cannot be empty');
    }
    if (entity.endedAt.isEmpty) {
      return ValidationFailure('ended at cannot be empty');
    }
    return null; // No validation errors
  }
}

