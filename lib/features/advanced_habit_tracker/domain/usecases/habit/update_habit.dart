import '../../entities/habit_entity.dart';
import '../../repositories/habit_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Habit entity.
///
/// This use case encapsulates the business logic for updating a Habit,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, HabitEntity&gt; for functional error handling.
class UpdateHabitUseCase extends BaseUseCase<HabitEntity, UpdateParams<HabitEntity>> {
  final HabitRepository repository;

  UpdateHabitUseCase(this.repository);

  @override
  Future<Either<Failure, HabitEntity>> call(UpdateParams<HabitEntity> params) async {
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
        return Left(ValidationFailure('Habit with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Habit: ${e.toString()}', e));
    }
  }

  /// Validates the Habit entity before update.
  ValidationFailure? _validateEntity(HabitEntity entity) {
    if (entity.title.isEmpty) {
      return ValidationFailure('title cannot be empty');
    }
    if (entity.description == null || entity.description!.isEmpty) {
      return ValidationFailure('description cannot be empty');
    }
    if (entity.isActive == null) {
      return ValidationFailure('is active is required');
    }
    if (entity.priority.isEmpty) {
      return ValidationFailure('priority cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    return null; // No validation errors
  }
}

