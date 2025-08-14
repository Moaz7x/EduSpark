import '../../entities/review_entity.dart';
import '../../repositories/review_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Review entity.
///
/// This use case encapsulates the business logic for creating a Review,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, ReviewEntity&gt; for functional error handling.
class CreateReviewUseCase extends BaseUseCase<ReviewEntity, ReviewEntity> {
  final ReviewRepository repository;

  CreateReviewUseCase(this.repository);

  @override
  Future<Either<Failure, ReviewEntity>> call(ReviewEntity params) async {
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
      return Left(UnknownFailure('Failed to create Review: ${e.toString()}', e));
    }
  }

  /// Validates the Review entity before creation.
  ValidationFailure? _validateEntity(ReviewEntity entity) {
    if (entity.reviewDate == null) {
      return ValidationFailure('review ate is required');
    }
    if (entity.isCorrect == null) {
      return ValidationFailure('is orrect is required');
    }
    if (entity.responseTime == null) {
      return ValidationFailure('response ime is required');
    }
    return null; // No validation errors
  }
}

