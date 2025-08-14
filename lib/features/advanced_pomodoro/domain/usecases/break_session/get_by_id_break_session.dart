import '../../entities/break_session_entity.dart';
import '../../repositories/break_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a BreakSession entity by ID.
///
/// This use case handles the business logic for fetching a specific BreakSession
/// by its unique identifier.
/// Returns Either&lt;Failure, BreakSessionEntity?&gt; for functional error handling.
class GetBreakSessionByIdUseCase extends BaseUseCase<BreakSessionEntity?, IdParams> {
  final BreakSessionRepository repository;

  GetBreakSessionByIdUseCase(this.repository);

  @override
  Future<Either<Failure, BreakSessionEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get BreakSession by ID: ${e.toString()}', e));
    }
  }
}

