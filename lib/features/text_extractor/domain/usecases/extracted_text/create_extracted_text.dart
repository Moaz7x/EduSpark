import '../../entities/extracted_text_entity.dart';
import '../../repositories/extracted_text_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new ExtractedText entity.
///
/// This use case encapsulates the business logic for creating a ExtractedText,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, ExtractedTextEntity&gt; for functional error handling.
class CreateExtractedTextUseCase extends BaseUseCase<ExtractedTextEntity, ExtractedTextEntity> {
  final ExtractedTextRepository repository;

  CreateExtractedTextUseCase(this.repository);

  @override
  Future<Either<Failure, ExtractedTextEntity>> call(ExtractedTextEntity params) async {
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
      return Left(UnknownFailure('Failed to create ExtractedText: ${e.toString()}', e));
    }
  }

  /// Validates the ExtractedText entity before creation.
  ValidationFailure? _validateEntity(ExtractedTextEntity entity) {
    if (entity.textContent.isEmpty) {
      return ValidationFailure('text ontent cannot be empty');
    }
    if (entity.language.isEmpty) {
      return ValidationFailure('language cannot be empty');
    }
    if (entity.isReviewed == null) {
      return ValidationFailure('is eviewed is required');
    }
    if (entity.isApproved == null) {
      return ValidationFailure('is pproved is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
    }
    return null; // No validation errors
  }
}

