import '../../entities/deck_entity.dart';
import '../../repositories/deck_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Deck entity.
///
/// This use case encapsulates the business logic for updating a Deck,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, DeckEntity&gt; for functional error handling.
class UpdateDeckUseCase extends BaseUseCase<DeckEntity, UpdateParams<DeckEntity>> {
  final DeckRepository repository;

  UpdateDeckUseCase(this.repository);

  @override
  Future<Either<Failure, DeckEntity>> call(UpdateParams<DeckEntity> params) async {
    // Validate the ID parameter
    if (params.id <= 0) {
      return Left(ValidationFailure('ID must be greater than 0 for update operation'));
    }

    // Validate entity fields
    final validationResult = _validateEntity(params.entity);
    if (validationResult != null) {
      return Left(validationResult);
    }

    try {
      // Check if entity exists before updating
      final existsResult = await repository.exists(params.id);
      final exists = existsResult.fold(
        (failure) => false,
        (exists) => exists,
      );
      if (!exists) {
        return Left(ValidationFailure('Deck with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Deck: ${e.toString()}', e));
    }
  }

  /// Validates the Deck entity before update.
  ValidationFailure? _validateEntity(DeckEntity entity) {
    if (entity.title.isEmpty) {
      return ValidationFailure('title cannot be empty');
    }
    if (entity.description == null || entity.description!.isEmpty) {
      return ValidationFailure('description cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    if (entity.flashcards == null) {
      return ValidationFailure('flashcards is required');
    }
    return null; // No validation errors
  }
}

