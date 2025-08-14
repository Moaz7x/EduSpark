import '../../entities/flashcard_entity.dart';
import '../../repositories/flashcard_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Flashcard entities.
///
/// This use case handles the business logic for fetching all available
/// Flashcard entities from the repository.
/// Returns Either&lt;Failure, List&lt;FlashcardEntity&gt;&gt; for functional error handling.
class GetAllFlashcardsUseCase extends NoParamsUseCase<List<FlashcardEntity>> {
  final FlashcardRepository repository;

  GetAllFlashcardsUseCase(this.repository);

  @override
  Future<Either<Failure, List<FlashcardEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Flashcards: ${e.toString()}', e));
    }
  }
}

