import '../../entities/review_entity.dart';
import '../../repositories/review_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Review entity.
///
/// This use case encapsulates the business logic for updating a Review,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, ReviewEntity&gt; for functional error handling.
class UpdateReviewUseCase extends BaseUseCase<ReviewEntity, UpdateParams<ReviewEntity>> {
  final ReviewRepository repository;

  UpdateReviewUseCase(this.repository);

  @override
  Future<Either<Failure, ReviewEntity>> call(UpdateParams<ReviewEntity> params) async {
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
        return Left(ValidationFailure('Review with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Review: ${e.toString()}', e));
    }
  }

  /// Validates the Review entity before update.
  ValidationFailure? _validateEntity(ReviewEntity entity) {
    if (entity.reviewDate == null) {
      return ValidationFailure('review date is required');
    }
    if (entity.isCorrect == null) {
      return ValidationFailure('is correct is required');
    }
    if (entity.responseTime == null) {
      return ValidationFailure('response time is required');
    }
    return null; // No validation errors
  }
}

