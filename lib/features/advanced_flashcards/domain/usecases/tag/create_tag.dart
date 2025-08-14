import '../../entities/tag_entity.dart';
import '../../repositories/tag_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Tag entity.
///
/// This use case encapsulates the business logic for creating a Tag,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, TagEntity&gt; for functional error handling.
class CreateTagUseCase extends BaseUseCase<TagEntity, TagEntity> {
  final TagRepository repository;

  CreateTagUseCase(this.repository);

  @override
  Future<Either<Failure, TagEntity>> call(TagEntity params) async {
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
      return Left(UnknownFailure('Failed to create Tag: ${e.toString()}', e));
    }
  }

  /// Validates the Tag entity before creation.
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

