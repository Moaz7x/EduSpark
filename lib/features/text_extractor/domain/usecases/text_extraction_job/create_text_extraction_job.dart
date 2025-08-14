import '../../entities/text_extraction_job_entity.dart';
import '../../repositories/text_extraction_job_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new TextExtractionJob entity.
///
/// This use case encapsulates the business logic for creating a TextExtractionJob,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, TextExtractionJobEntity&gt; for functional error handling.
class CreateTextExtractionJobUseCase extends BaseUseCase<TextExtractionJobEntity, TextExtractionJobEntity> {
  final TextExtractionJobRepository repository;

  CreateTextExtractionJobUseCase(this.repository);

  @override
  Future<Either<Failure, TextExtractionJobEntity>> call(TextExtractionJobEntity params) async {
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
      return Left(UnknownFailure('Failed to create TextExtractionJob: ${e.toString()}', e));
    }
  }

  /// Validates the TextExtractionJob entity before creation.
  ValidationFailure? _validateEntity(TextExtractionJobEntity entity) {
    if (entity.jobType.isEmpty) {
      return ValidationFailure('job ype cannot be empty');
    }
    if (entity.jobStatus.isEmpty) {
      return ValidationFailure('job tatus cannot be empty');
    }
    if (entity.requestedAt.isEmpty) {
      return ValidationFailure('requested t cannot be empty');
    }
    if (entity.completedAt.isEmpty) {
      return ValidationFailure('completed t cannot be empty');
    }
    if (entity.errorMessage.isEmpty) {
      return ValidationFailure('error essage cannot be empty');
    }
    if (entity.extractedtexts == null) {
      return ValidationFailure('extractedtexts is required');
    }
    return null; // No validation errors
  }
}

