import '../../entities/deck_entity.dart';
import '../../repositories/deck_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving paginated Deck entities.
///
/// This use case handles the business logic for fetching Deck entities
/// in paginated chunks for efficient data loading.
/// Returns Either&lt;Failure, List&lt;DeckEntity&gt;&gt; for functional error handling.
class GetPaginatedDecksUseCase extends BaseUseCase<List<DeckEntity>, PaginationParams> {
  final DeckRepository repository;

  GetPaginatedDecksUseCase(this.repository);

  @override
  Future<Either<Failure, List<DeckEntity>>> call(PaginationParams params) async {
    // Validate pagination parameters
    if (params.page < 1) {
      return Left(ValidationFailure('Page number must be greater than 0'));
    }
    if (params.limit < 1) {
      return Left(ValidationFailure('Limit must be greater than 0'));
    }
    if (params.limit > 100) {
      return Left(ValidationFailure('Limit cannot exceed 100 items per page'));
    }

    try {
      final result = await repository.getPaginated(params.page, params.limit);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get paginated Decks: ${e.toString()}', e));
    }
  }
}

