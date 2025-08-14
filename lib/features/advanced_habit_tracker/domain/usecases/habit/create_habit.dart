import '../../entities/habit_entity.dart';
import '../../repositories/habit_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Habit entity.
///
/// This use case encapsulates the business logic for creating a Habit,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, HabitEntity&gt; for functional error handling.
class CreateHabitUseCase extends BaseUseCase<HabitEntity, HabitEntity> {
  final HabitRepository repository;

  CreateHabitUseCase(this.repository);

  @override
  Future<Either<Failure, HabitEntity>> call(HabitEntity params) async {
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
      return Left(UnknownFailure('Failed to create Habit: ${e.toString()}', e));
    }
  }

  /// Validates the Habit entity before creation.
  ValidationFailure? _validateEntity(HabitEntity entity) {
    if (entity.title.isEmpty) {
      return ValidationFailure('title cannot be empty');
    }
    if (entity.description?.isEmpty ?? true) {
      return ValidationFailure('description cannot be empty');
    }
    if (entity.isActive == null) {
      return ValidationFailure('is ctive is required');
    }
    if (entity.priority.isEmpty) {
      return ValidationFailure('priority cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
    }
    return null; // No validation errors
  }
}

