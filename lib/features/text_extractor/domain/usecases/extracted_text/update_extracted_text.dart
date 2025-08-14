import '../../entities/extracted_text_entity.dart';
import '../../repositories/extracted_text_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing ExtractedText entity.
///
/// This use case encapsulates the business logic for updating a ExtractedText,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, ExtractedTextEntity&gt; for functional error handling.
class UpdateExtractedTextUseCase extends BaseUseCase<ExtractedTextEntity, UpdateParams<ExtractedTextEntity>> {
  final ExtractedTextRepository repository;

  UpdateExtractedTextUseCase(this.repository);

  @override
  Future<Either<Failure, ExtractedTextEntity>> call(UpdateParams<ExtractedTextEntity> params) async {
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
        return Left(ValidationFailure('ExtractedText with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update ExtractedText: ${e.toString()}', e));
    }
  }

  /// Validates the ExtractedText entity before update.
  ValidationFailure? _validateEntity(ExtractedTextEntity entity) {
    if (entity.textContent.isEmpty) {
      return ValidationFailure('text content cannot be empty');
    }
    if (entity.language.isEmpty) {
      return ValidationFailure('language cannot be empty');
    }
    if (entity.isReviewed == null) {
      return ValidationFailure('is reviewed is required');
    }
    if (entity.isApproved == null) {
      return ValidationFailure('is approved is required');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    return null; // No validation errors
  }
}

