import '../../entities/flashcard_entity.dart';
import '../../repositories/flashcard_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Flashcard entity.
///
/// This use case encapsulates the business logic for creating a Flashcard,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, FlashcardEntity&gt; for functional error handling.
class CreateFlashcardUseCase extends BaseUseCase<FlashcardEntity, FlashcardEntity> {
  final FlashcardRepository repository;

  CreateFlashcardUseCase(this.repository);

  @override
  Future<Either<Failure, FlashcardEntity>> call(FlashcardEntity params) async {
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
      return Left(UnknownFailure('Failed to create Flashcard: ${e.toString()}', e));
    }
  }

  /// Validates the Flashcard entity before creation.
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
      return ValidationFailure('is ctive is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
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

