import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Task entity.
///
/// This use case encapsulates the business logic for updating a Task,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, TaskEntity&gt; for functional error handling.
class UpdateTaskUseCase extends BaseUseCase<TaskEntity, UpdateParams<TaskEntity>> {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(UpdateParams<TaskEntity> params) async {
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
        return Left(ValidationFailure('Task with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Task: ${e.toString()}', e));
    }
  }

  /// Validates the Task entity before update.
  ValidationFailure? _validateEntity(TaskEntity entity) {
    if (entity.title.isEmpty) {
      return ValidationFailure('title cannot be empty');
    }
    if (entity.description == null || entity.description!.isEmpty) {
      return ValidationFailure('description cannot be empty');
    }
    if (entity.isCompleted == null) {
      return ValidationFailure('is completed is required');
    }
    if (entity.priority.isEmpty) {
      return ValidationFailure('priority cannot be empty');
    }
    if (entity.dueDate == null) {
      return ValidationFailure('due date is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    if (entity.pomodorosessions == null) {
      return ValidationFailure('pomodorosessions is required');
    }
    return null; // No validation errors
  }
}

