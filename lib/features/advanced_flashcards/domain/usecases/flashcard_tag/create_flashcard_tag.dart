import '../../entities/flashcard_tag_entity.dart';
import '../../repositories/flashcard_tag_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new FlashcardTag entity.
///
/// This use case encapsulates the business logic for creating a FlashcardTag,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, FlashcardTagEntity&gt; for functional error handling.
class CreateFlashcardTagUseCase extends BaseUseCase<FlashcardTagEntity, FlashcardTagEntity> {
  final FlashcardTagRepository repository;

  CreateFlashcardTagUseCase(this.repository);

  @override
  Future<Either<Failure, FlashcardTagEntity>> call(FlashcardTagEntity params) async {
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
      return Left(UnknownFailure('Failed to create FlashcardTag: ${e.toString()}', e));
    }
  }

  /// Validates the FlashcardTag entity before creation.
  ValidationFailure? _validateEntity(FlashcardTagEntity entity) {
    return null; // No validation errors
  }
}

