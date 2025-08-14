import '../../entities/media_entity.dart';
import '../../repositories/media_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a Media entity by ID.
///
/// This use case handles the business logic for fetching a specific Media
/// by its unique identifier.
/// Returns Either&lt;Failure, MediaEntity?&gt; for functional error handling.
class GetMediaByIdUseCase extends BaseUseCase<MediaEntity?, IdParams> {
  final MediaRepository repository;

  GetMediaByIdUseCase(this.repository);

  @override
  Future<Either<Failure, MediaEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get Media by ID: ${e.toString()}', e));
    }
  }
}

