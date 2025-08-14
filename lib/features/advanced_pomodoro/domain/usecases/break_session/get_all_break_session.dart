import '../../entities/break_session_entity.dart';
import '../../repositories/break_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all BreakSession entities.
///
/// This use case handles the business logic for fetching all available
/// BreakSession entities from the repository.
/// Returns Either&lt;Failure, List&lt;BreakSessionEntity&gt;&gt; for functional error handling.
class GetAllBreakSessionsUseCase extends NoParamsUseCase<List<BreakSessionEntity>> {
  final BreakSessionRepository repository;

  GetAllBreakSessionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<BreakSessionEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all BreakSessions: ${e.toString()}', e));
    }
  }
}

