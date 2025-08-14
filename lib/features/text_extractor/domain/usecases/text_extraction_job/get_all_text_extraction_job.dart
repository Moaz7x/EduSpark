import '../../entities/text_extraction_job_entity.dart';
import '../../repositories/text_extraction_job_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all TextExtractionJob entities.
///
/// This use case handles the business logic for fetching all available
/// TextExtractionJob entities from the repository.
/// Returns Either&lt;Failure, List&lt;TextExtractionJobEntity&gt;&gt; for functional error handling.
class GetAllTextExtractionJobsUseCase extends NoParamsUseCase<List<TextExtractionJobEntity>> {
  final TextExtractionJobRepository repository;

  GetAllTextExtractionJobsUseCase(this.repository);

  @override
  Future<Either<Failure, List<TextExtractionJobEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all TextExtractionJobs: ${e.toString()}', e));
    }
  }
}

