import '../../entities/category_entity.dart';
import '../../repositories/category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Category entity.
///
/// This use case encapsulates the business logic for creating a Category,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, CategoryEntity&gt; for functional error handling.
class CreateCategoryUseCase extends BaseUseCase<CategoryEntity, CategoryEntity> {
  final CategoryRepository repository;

  CreateCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(CategoryEntity params) async {
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
      return Left(UnknownFailure('Failed to create Category: ${e.toString()}', e));
    }
  }

  /// Validates the Category entity before creation.
  ValidationFailure? _validateEntity(CategoryEntity entity) {
    if (entity.name.isEmpty) {
      return ValidationFailure('name cannot be empty');
    }
    if (entity.description?.isEmpty ?? true) {
      return ValidationFailure('description cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
    }
    if (entity.tasks == null) {
      return ValidationFailure('tasks is required');
    }
    return null; // No validation errors
  }
}

