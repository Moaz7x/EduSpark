import '../../entities/media_source_entity.dart';
import '../../repositories/media_source_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing MediaSource entity.
///
/// This use case encapsulates the business logic for updating a MediaSource,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, MediaSourceEntity&gt; for functional error handling.
class UpdateMediaSourceUseCase extends BaseUseCase<MediaSourceEntity, UpdateParams<MediaSourceEntity>> {
  final MediaSourceRepository repository;

  UpdateMediaSourceUseCase(this.repository);

  @override
  Future<Either<Failure, MediaSourceEntity>> call(UpdateParams<MediaSourceEntity> params) async {
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
        return Left(ValidationFailure('MediaSource with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update MediaSource: ${e.toString()}', e));
    }
  }

  /// Validates the MediaSource entity before update.
  ValidationFailure? _validateEntity(MediaSourceEntity entity) {
    if (entity.type.isEmpty) {
      return ValidationFailure('type cannot be empty');
    }
    if (entity.url == null || entity.url!.isEmpty) {
      return ValidationFailure('url cannot be empty');
    }
    if (entity.fileName.isEmpty) {
      return ValidationFailure('file name cannot be empty');
    }
    if (entity.fileSize.isEmpty) {
      return ValidationFailure('file size cannot be empty');
    }
    if (entity.updatedAt == null) {
      return ValidationFailure('updated at is required');
    }
    if (entity.textextractionjobs == null) {
      return ValidationFailure('textextractionjobs is required');
    }
    return null; // No validation errors
  }
}

