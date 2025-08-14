import '../../entities/deck_entity.dart';
import '../../repositories/deck_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Deck entities.
///
/// This use case handles the business logic for fetching all available
/// Deck entities from the repository.
/// Returns Either&lt;Failure, List&lt;DeckEntity&gt;&gt; for functional error handling.
class GetAllDecksUseCase extends NoParamsUseCase<List<DeckEntity>> {
  final DeckRepository repository;

  GetAllDecksUseCase(this.repository);

  @override
  Future<Either<Failure, List<DeckEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Decks: ${e.toString()}', e));
    }
  }
}

