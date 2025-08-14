import '../../entities/media_entity.dart';
import '../../repositories/media_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Media entities.
///
/// This use case handles the business logic for fetching all available
/// Media entities from the repository.
/// Returns Either&lt;Failure, List&lt;MediaEntity&gt;&gt; for functional error handling.
class GetAllMediasUseCase extends NoParamsUseCase<List<MediaEntity>> {
  final MediaRepository repository;

  GetAllMediasUseCase(this.repository);

  @override
  Future<Either<Failure, List<MediaEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Medias: ${e.toString()}', e));
    }
  }
}

