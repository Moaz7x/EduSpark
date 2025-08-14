import '../../entities/flashcard_tag_entity.dart';
import '../../repositories/flashcard_tag_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all FlashcardTag entities.
///
/// This use case handles the business logic for fetching all available
/// FlashcardTag entities from the repository.
/// Returns Either&lt;Failure, List&lt;FlashcardTagEntity&gt;&gt; for functional error handling.
class GetAllFlashcardTagsUseCase extends NoParamsUseCase<List<FlashcardTagEntity>> {
  final FlashcardTagRepository repository;

  GetAllFlashcardTagsUseCase(this.repository);

  @override
  Future<Either<Failure, List<FlashcardTagEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all FlashcardTags: ${e.toString()}', e));
    }
  }
}

