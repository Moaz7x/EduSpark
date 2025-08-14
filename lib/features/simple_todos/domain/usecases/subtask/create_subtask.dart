import '../../entities/subtask_entity.dart';
import '../../repositories/subtask_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Subtask entity.
///
/// This use case encapsulates the business logic for creating a Subtask,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, SubtaskEntity&gt; for functional error handling.
class CreateSubtaskUseCase extends BaseUseCase<SubtaskEntity, SubtaskEntity> {
  final SubtaskRepository repository;

  CreateSubtaskUseCase(this.repository);

  @override
  Future<Either<Failure, SubtaskEntity>> call(SubtaskEntity params) async {
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
      return Left(UnknownFailure('Failed to create Subtask: ${e.toString()}', e));
    }
  }

  /// Validates the Subtask entity before creation.
  ValidationFailure? _validateEntity(SubtaskEntity entity) {
    if (entity.title.isEmpty) {
      return ValidationFailure('title cannot be empty');
    }
    if (entity.isCompleted == null) {
      return ValidationFailure('is ompleted is required');
    }
    if (entity.order.isEmpty) {
      return ValidationFailure('order cannot be empty');
    }
    if (entity.estimatedMinutes.isEmpty) {
      return ValidationFailure('estimated inutes cannot be empty');
    }
    if (entity.notes.isEmpty) {
      return ValidationFailure('notes cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
    }
    return null; // No validation errors
  }
}

