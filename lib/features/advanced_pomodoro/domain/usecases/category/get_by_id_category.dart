import '../../entities/category_entity.dart';
import '../../repositories/category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a Category entity by ID.
///
/// This use case handles the business logic for fetching a specific Category
/// by its unique identifier.
/// Returns Either&lt;Failure, CategoryEntity?&gt; for functional error handling.
class GetCategoryByIdUseCase extends BaseUseCase<CategoryEntity?, IdParams> {
  final CategoryRepository repository;

  GetCategoryByIdUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryEntity?>> call(IdParams params) async {
    // Validate ID parameter
    if (params.id <= 0) {
      return Left(ValidationFailure('ID must be greater than 0'));
    }

    try {
      final result = await repository.getById(params.id);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get Category by ID: ${e.toString()}', e));
    }
  }
}

