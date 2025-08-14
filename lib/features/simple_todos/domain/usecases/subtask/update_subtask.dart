import '../../entities/subtask_entity.dart';
import '../../repositories/subtask_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Subtask entity.
///
/// This use case encapsulates the business logic for updating a Subtask,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, SubtaskEntity&gt; for functional error handling.
class UpdateSubtaskUseCase extends BaseUseCase<SubtaskEntity, UpdateParams<SubtaskEntity>> {
  final SubtaskRepository repository;

  UpdateSubtaskUseCase(this.repository);

  @override
  Future<Either<Failure, SubtaskEntity>> call(UpdateParams<SubtaskEntity> params) async {
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
        return Left(ValidationFailure('Subtask with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Subtask: ${e.toString()}', e));
    }
  }

  /// Validates the Subtask entity before update.
  ValidationFailure? _validateEntity(SubtaskEntity entity) {
    if (entity.title.isEmpty) {
      return ValidationFailure('title cannot be empty');
    }
    if (entity.isCompleted == null) {
      return ValidationFailure('is completed is required');
    }
    if (entity.order.isEmpty) {
      return ValidationFailure('order cannot be empty');
    }
    if (entity.estimatedMinutes.isEmpty) {
      return ValidationFailure('estimated minutes cannot be empty');
    }
    if (entity.notes.isEmpty) {
      return ValidationFailure('notes cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    return null; // No validation errors
  }
}

