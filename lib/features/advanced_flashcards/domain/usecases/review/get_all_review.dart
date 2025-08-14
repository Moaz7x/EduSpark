import '../../entities/review_entity.dart';
import '../../repositories/review_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Review entities.
///
/// This use case handles the business logic for fetching all available
/// Review entities from the repository.
/// Returns Either&lt;Failure, List&lt;ReviewEntity&gt;&gt; for functional error handling.
class GetAllReviewsUseCase extends NoParamsUseCase<List<ReviewEntity>> {
  final ReviewRepository repository;

  GetAllReviewsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ReviewEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Reviews: ${e.toString()}', e));
    }
  }
}

