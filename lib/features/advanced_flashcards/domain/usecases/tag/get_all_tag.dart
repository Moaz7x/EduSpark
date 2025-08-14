import '../../entities/tag_entity.dart';
import '../../repositories/tag_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Tag entities.
///
/// This use case handles the business logic for fetching all available
/// Tag entities from the repository.
/// Returns Either&lt;Failure, List&lt;TagEntity&gt;&gt; for functional error handling.
class GetAllTagsUseCase extends NoParamsUseCase<List<TagEntity>> {
  final TagRepository repository;

  GetAllTagsUseCase(this.repository);

  @override
  Future<Either<Failure, List<TagEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Tags: ${e.toString()}', e));
    }
  }
}

