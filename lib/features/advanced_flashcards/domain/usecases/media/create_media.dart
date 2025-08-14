import '../../entities/media_entity.dart';
import '../../repositories/media_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Media entity.
///
/// This use case encapsulates the business logic for creating a Media,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, MediaEntity&gt; for functional error handling.
class CreateMediaUseCase extends BaseUseCase<MediaEntity, MediaEntity> {
  final MediaRepository repository;

  CreateMediaUseCase(this.repository);

  @override
  Future<Either<Failure, MediaEntity>> call(MediaEntity params) async {
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
      return Left(UnknownFailure('Failed to create Media: ${e.toString()}', e));
    }
  }

  /// Validates the Media entity before creation.
  ValidationFailure? _validateEntity(MediaEntity entity) {
    if (entity.type.isEmpty) {
      return ValidationFailure('type cannot be empty');
    }
    if (entity.url?.isEmpty ?? true) {
      return ValidationFailure('url cannot be empty');
    }
    if (entity.description?.isEmpty ?? true) {
      return ValidationFailure('description cannot be empty');
    }
    return null; // No validation errors
  }
}

