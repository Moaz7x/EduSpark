import '../../entities/deck_entity.dart';
import '../../repositories/deck_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Deck entity.
///
/// This use case encapsulates the business logic for creating a Deck,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, DeckEntity&gt; for functional error handling.
class CreateDeckUseCase extends BaseUseCase<DeckEntity, DeckEntity> {
  final DeckRepository repository;

  CreateDeckUseCase(this.repository);

  @override
  Future<Either<Failure, DeckEntity>> call(DeckEntity params) async {
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
      return Left(UnknownFailure('Failed to create Deck: ${e.toString()}', e));
    }
  }

  /// Validates the Deck entity before creation.
  ValidationFailure? _validateEntity(DeckEntity entity) {
    if (entity.title.isEmpty) {
      return ValidationFailure('title cannot be empty');
    }
    if (entity.description?.isEmpty ?? true) {
      return ValidationFailure('description cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
    }
    if (entity.flashcards == null) {
      return ValidationFailure('flashcards is required');
    }
    return null; // No validation errors
  }
}

