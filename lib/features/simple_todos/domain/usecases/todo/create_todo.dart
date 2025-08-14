import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Todo entity.
///
/// This use case encapsulates the business logic for creating a Todo,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, TodoEntity&gt; for functional error handling.
class CreateTodoUseCase extends BaseUseCase<TodoEntity, TodoEntity> {
  final TodoRepository repository;

  CreateTodoUseCase(this.repository);

  @override
  Future<Either<Failure, TodoEntity>> call(TodoEntity params) async {
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
      return Left(UnknownFailure('Failed to create Todo: ${e.toString()}', e));
    }
  }

  /// Validates the Todo entity before creation.
  ValidationFailure? _validateEntity(TodoEntity entity) {
    if (entity.title.isEmpty) {
      return ValidationFailure('title cannot be empty');
    }
    if (entity.description?.isEmpty ?? true) {
      return ValidationFailure('description cannot be empty');
    }
    if (entity.isCompleted == null) {
      return ValidationFailure('is ompleted is required');
    }
    if (entity.priority.isEmpty) {
      return ValidationFailure('priority cannot be empty');
    }
    if (entity.order.isEmpty) {
      return ValidationFailure('order cannot be empty');
    }
    if (entity.dueDate == null) {
      return ValidationFailure('due ate is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
    }
   
    return null; // No validation errors
  }
}

