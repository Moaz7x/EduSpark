import '../../entities/flashcard_entity.dart';
import '../../repositories/flashcard_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Flashcard entity.
///
/// This use case encapsulates the business logic for updating a Flashcard,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, FlashcardEntity&gt; for functional error handling.
class UpdateFlashcardUseCase extends BaseUseCase<FlashcardEntity, UpdateParams<FlashcardEntity>> {
  final FlashcardRepository repository;

  UpdateFlashcardUseCase(this.repository);

  @override
  Future<Either<Failure, FlashcardEntity>> call(UpdateParams<FlashcardEntity> params) async {
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
        return Left(ValidationFailure('Flashcard with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Flashcard: ${e.toString()}', e));
    }
  }

  /// Validates the Flashcard entity before update.
  ValidationFailure? _validateEntity(FlashcardEntity entity) {
    if (entity.question.isEmpty) {
      return ValidationFailure('question cannot be empty');
    }
    if (entity.answer.isEmpty) {
      return ValidationFailure('answer cannot be empty');
    }
    if (entity.explanation.isEmpty) {
      return ValidationFailure('explanation cannot be empty');
    }
    if (entity.isActive == null) {
      return ValidationFailure('is active is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    if (entity.medias == null) {
      return ValidationFailure('medias is required');
    }
    if (entity.reviews == null) {
      return ValidationFailure('reviews is required');
    }
    if (entity.flashcardtags == null) {
      return ValidationFailure('flashcardtags is required');
    }
    return null; // No validation errors
  }
}

