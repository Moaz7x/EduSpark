import '../../entities/review_entity.dart';
import '../../repositories/review_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for searching Review entities with text queries.
///
/// This use case handles the business logic for performing text-based
/// searches across Review entities.
/// Returns Either&lt;Failure, List&lt;ReviewEntity&gt;&gt; for functional error handling.
class SearchReviewsUseCase extends BaseUseCase<List<ReviewEntity>, SearchParams> {
  final ReviewRepository repository;

  SearchReviewsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ReviewEntity>>> call(SearchParams params) async {
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
      return Left(UnknownFailure('Failed to search Reviews: ${e.toString()}', e));
    }
  }
}

