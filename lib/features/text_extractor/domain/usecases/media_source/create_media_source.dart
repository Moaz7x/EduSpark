import '../../entities/media_source_entity.dart';
import '../../repositories/media_source_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new MediaSource entity.
///
/// This use case encapsulates the business logic for creating a MediaSource,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, MediaSourceEntity&gt; for functional error handling.
class CreateMediaSourceUseCase extends BaseUseCase<MediaSourceEntity, MediaSourceEntity> {
  final MediaSourceRepository repository;

  CreateMediaSourceUseCase(this.repository);

  @override
  Future<Either<Failure, MediaSourceEntity>> call(MediaSourceEntity params) async {
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
      return Left(UnknownFailure('Failed to create MediaSource: ${e.toString()}', e));
    }
  }

  /// Validates the MediaSource entity before creation.
  ValidationFailure? _validateEntity(MediaSourceEntity entity) {
    if (entity.type.isEmpty) {
      return ValidationFailure('type cannot be empty');
    }
    if (entity.url?.isEmpty ?? true) {
      return ValidationFailure('url cannot be empty');
    }
    if (entity.fileName.isEmpty) {
      return ValidationFailure('file ame cannot be empty');
    }
    if (entity.fileSize.isEmpty) {
      return ValidationFailure('file ize cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated t is required');
    }
    if (entity.textextractionjobs == null) {
      return ValidationFailure('textextractionjobs is required');
    }
    return null; // No validation errors
  }
}

