import '../../entities/tag_entity.dart';
import '../../repositories/tag_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Tag entity.
///
/// This use case encapsulates the business logic for updating a Tag,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, TagEntity&gt; for functional error handling.
class UpdateTagUseCase extends BaseUseCase<TagEntity, UpdateParams<TagEntity>> {
  final TagRepository repository;

  UpdateTagUseCase(this.repository);

  @override
  Future<Either<Failure, TagEntity>> call(UpdateParams<TagEntity> params) async {
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
        return Left(ValidationFailure('Tag with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Tag: ${e.toString()}', e));
    }
  }

  /// Validates the Tag entity before update.
  ValidationFailure? _validateEntity(TagEntity entity) {
    if (entity.name.isEmpty) {
      return ValidationFailure('name cannot be empty');
    }
    if (entity.flashcardtags == null) {
      return ValidationFailure('flashcardtags is required');
    }
    return null; // No validation errors
  }
}

