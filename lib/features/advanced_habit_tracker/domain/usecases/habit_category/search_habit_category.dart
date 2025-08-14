import '../../entities/habit_category_entity.dart';
import '../../repositories/habit_category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for searching HabitCategory entities with text queries.
///
/// This use case handles the business logic for performing text-based
/// searches across HabitCategory entities.
/// Returns Either&lt;Failure, List&lt;HabitCategoryEntity&gt;&gt; for functional error handling.
class SearchHabitCategorysUseCase extends BaseUseCase<List<HabitCategoryEntity>, SearchParams> {
  final HabitCategoryRepository repository;

  SearchHabitCategorysUseCase(this.repository);

  @override
  Future<Either<Failure, List<HabitCategoryEntity>>> call(SearchParams params) async {
    // Validate search parameters
    if (params.query.length < 2 && params.query.trim().isNotEmpty) {
      return Left(ValidationFailure('Search query must be at least 2 characters long'));
    }

    try {
if (params.query.trim().isEmpty) {
        return await repository.getAll();
      } else {
        return await repository.search(params.query.trim());
      }
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to search HabitCategorys: ${e.toString()}', e));
    }
  }
}

