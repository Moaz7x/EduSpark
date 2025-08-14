import '../../entities/text_extraction_job_entity.dart';
import '../../repositories/text_extraction_job_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing TextExtractionJob entity.
///
/// This use case encapsulates the business logic for updating a TextExtractionJob,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, TextExtractionJobEntity&gt; for functional error handling.
class UpdateTextExtractionJobUseCase extends BaseUseCase<TextExtractionJobEntity, UpdateParams<TextExtractionJobEntity>> {
  final TextExtractionJobRepository repository;

  UpdateTextExtractionJobUseCase(this.repository);

  @override
  Future<Either<Failure, TextExtractionJobEntity>> call(UpdateParams<TextExtractionJobEntity> params) async {
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
        return Left(ValidationFailure('TextExtractionJob with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update TextExtractionJob: ${e.toString()}', e));
    }
  }

  /// Validates the TextExtractionJob entity before update.
  ValidationFailure? _validateEntity(TextExtractionJobEntity entity) {
    if (entity.jobType.isEmpty) {
      return ValidationFailure('job type cannot be empty');
    }
    if (entity.jobStatus.isEmpty) {
      return ValidationFailure('job status cannot be empty');
    }
    if (entity.requestedAt.isEmpty) {
      return ValidationFailure('requested at cannot be empty');
    }
    if (entity.completedAt.isEmpty) {
      return ValidationFailure('completed at cannot be empty');
    }
    if (entity.errorMessage.isEmpty) {
      return ValidationFailure('error message cannot be empty');
    }
    if (entity.extractedtexts == null) {
      return ValidationFailure('extractedtexts is required');
    }
    return null; // No validation errors
  }
}

