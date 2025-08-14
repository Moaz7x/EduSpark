import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes
import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types

/// Use case for updating an existing Todo entity.
///
/// This use case encapsulates the business logic for updating a Todo,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, TodoEntity&gt; for functional error handling.
class UpdateTodoUseCase extends BaseUseCase<TodoEntity, UpdateParams<TodoEntity>> {
  final TodoRepository repository;

  UpdateTodoUseCase(this.repository);

  @override
  Future<Either<Failure, TodoEntity>> call(UpdateParams<TodoEntity> params) async {
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
      final exists = existsResult.fold((failure) => false, (exists) => exists);
      if (!exists) {
        return Left(ValidationFailure('Todo with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Todo: ${e.toString()}', e));
    }
  }

  /// Validates the Todo entity before update.
  ValidationFailure? _validateEntity(TodoEntity entity) {
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
    if (entity.order.isEmpty) {
      return ValidationFailure('order cannot be empty');
    }
    if (entity.dueDate == null) {
      return ValidationFailure('due date is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }

    return null; // No validation errors
  }
}
