import '../../entities/flashcard_tag_entity.dart';
import '../../repositories/flashcard_tag_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for searching FlashcardTag entities with text queries.
///
/// This use case handles the business logic for performing text-based
/// searches across FlashcardTag entities.
/// Returns Either&lt;Failure, List&lt;FlashcardTagEntity&gt;&gt; for functional error handling.
class SearchFlashcardTagsUseCase extends BaseUseCase<List<FlashcardTagEntity>, SearchParams> {
  final FlashcardTagRepository repository;

  SearchFlashcardTagsUseCase(this.repository);

  @override
  Future<Either<Failure, List<FlashcardTagEntity>>> call(SearchParams params) async {
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
      return Left(UnknownFailure('Failed to search FlashcardTags: ${e.toString()}', e));
    }
  }
}

