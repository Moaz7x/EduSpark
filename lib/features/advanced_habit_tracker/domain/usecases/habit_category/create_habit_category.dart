import '../../entities/habit_category_entity.dart';
import '../../repositories/habit_category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new HabitCategory entity.
///
/// This use case encapsulates the business logic for creating a HabitCategory,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, HabitCategoryEntity&gt; for functional error handling.
class CreateHabitCategoryUseCase extends BaseUseCase<HabitCategoryEntity, HabitCategoryEntity> {
  final HabitCategoryRepository repository;

  CreateHabitCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, HabitCategoryEntity>> call(HabitCategoryEntity params) async {
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
      return Left(UnknownFailure('Failed to create HabitCategory: ${e.toString()}', e));
    }
  }

  /// Validates the HabitCategory entity before creation.
  ValidationFailure? _validateEntity(HabitCategoryEntity entity) {
    if (entity.name.isEmpty) {
      return ValidationFailure('name cannot be empty');
    }
    if (entity.description?.isEmpty ?? true) {
      return ValidationFailure('description cannot be empty');
    }
    return null; // No validation errors
  }
}

