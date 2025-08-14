import '../../entities/text_extraction_job_entity.dart';
import '../../repositories/text_extraction_job_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving paginated TextExtractionJob entities.
///
/// This use case handles the business logic for fetching TextExtractionJob entities
/// in paginated chunks for efficient data loading.
/// Returns Either&lt;Failure, List&lt;TextExtractionJobEntity&gt;&gt; for functional error handling.
class GetPaginatedTextExtractionJobsUseCase extends BaseUseCase<List<TextExtractionJobEntity>, PaginationParams> {
  final TextExtractionJobRepository repository;

  GetPaginatedTextExtractionJobsUseCase(this.repository);

  @override
  Future<Either<Failure, List<TextExtractionJobEntity>>> call(PaginationParams params) async {
    // Validate pagination parameters
    if (params.page < 1) {
      return Left(ValidationFailure('Page number must be greater than 0'));
    }
    if (params.limit < 1) {
      return Left(ValidationFailure('Limit must be greater than 0'));
    }
    if (params.limit > 100) {
      return Left(ValidationFailure('Limit cannot exceed 100 items per page'));
    }

    try {
      final result = await repository.getPaginated(params.page, params.limit);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get paginated TextExtractionJobs: ${e.toString()}', e));
    }
  }
}

