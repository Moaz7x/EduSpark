import '../../entities/category_entity.dart';
import '../../repositories/category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Category entity.
///
/// This use case encapsulates the business logic for updating a Category,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, CategoryEntity&gt; for functional error handling.
class UpdateCategoryUseCase extends BaseUseCase<CategoryEntity, UpdateParams<CategoryEntity>> {
  final CategoryRepository repository;

  UpdateCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(UpdateParams<CategoryEntity> params) async {
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
        return Left(ValidationFailure('Category with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Category: ${e.toString()}', e));
    }
  }

  /// Validates the Category entity before update.
  ValidationFailure? _validateEntity(CategoryEntity entity) {
    if (entity.name.isEmpty) {
      return ValidationFailure('name cannot be empty');
    }
    if (entity.description == null || entity.description!.isEmpty) {
      return ValidationFailure('description cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    if (entity.tasks == null) {
      return ValidationFailure('tasks is required');
    }
    return null; // No validation errors
  }
}

