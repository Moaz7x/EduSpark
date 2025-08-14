import '../../entities/text_extraction_job_entity.dart';
import '../../repositories/text_extraction_job_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a TextExtractionJob entity by ID.
///
/// This use case handles the business logic for fetching a specific TextExtractionJob
/// by its unique identifier.
/// Returns Either&lt;Failure, TextExtractionJobEntity?&gt; for functional error handling.
class GetTextExtractionJobByIdUseCase extends BaseUseCase<TextExtractionJobEntity?, IdParams> {
  final TextExtractionJobRepository repository;

  GetTextExtractionJobByIdUseCase(this.repository);

  @override
  Future<Either<Failure, TextExtractionJobEntity?>> call(IdParams params) async {
    // Validate ID parameter
    if (params.id <= 0) {
      return Left(ValidationFailure('ID must be greater than 0'));
    }

    try {
      final result = await repository.getById(params.id);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get TextExtractionJob by ID: ${e.toString()}', e));
    }
  }
}

