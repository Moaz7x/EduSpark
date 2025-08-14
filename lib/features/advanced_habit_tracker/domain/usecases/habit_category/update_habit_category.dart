import '../../entities/habit_category_entity.dart';
import '../../repositories/habit_category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing HabitCategory entity.
///
/// This use case encapsulates the business logic for updating a HabitCategory,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, HabitCategoryEntity&gt; for functional error handling.
class UpdateHabitCategoryUseCase extends BaseUseCase<HabitCategoryEntity, UpdateParams<HabitCategoryEntity>> {
  final HabitCategoryRepository repository;

  UpdateHabitCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, HabitCategoryEntity>> call(UpdateParams<HabitCategoryEntity> params) async {
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
        return Left(ValidationFailure('HabitCategory with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update HabitCategory: ${e.toString()}', e));
    }
  }

  /// Validates the HabitCategory entity before update.
  ValidationFailure? _validateEntity(HabitCategoryEntity entity) {
    if (entity.name.isEmpty) {
      return ValidationFailure('name cannot be empty');
    }
    if (entity.description == null || entity.description!.isEmpty) {
      return ValidationFailure('description cannot be empty');
    }
    return null; // No validation errors
  }
}

