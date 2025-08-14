import '../../entities/extracted_text_entity.dart';
import '../../repositories/extracted_text_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all ExtractedText entities.
///
/// This use case handles the business logic for fetching all available
/// ExtractedText entities from the repository.
/// Returns Either&lt;Failure, List&lt;ExtractedTextEntity&gt;&gt; for functional error handling.
class GetAllExtractedTextsUseCase extends NoParamsUseCase<List<ExtractedTextEntity>> {
  final ExtractedTextRepository repository;

  GetAllExtractedTextsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ExtractedTextEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all ExtractedTexts: ${e.toString()}', e));
    }
  }
}

