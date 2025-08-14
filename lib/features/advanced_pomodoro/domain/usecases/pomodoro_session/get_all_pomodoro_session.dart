import '../../entities/pomodoro_session_entity.dart';
import '../../repositories/pomodoro_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all PomodoroSession entities.
///
/// This use case handles the business logic for fetching all available
/// PomodoroSession entities from the repository.
/// Returns Either&lt;Failure, List&lt;PomodoroSessionEntity&gt;&gt; for functional error handling.
class GetAllPomodoroSessionsUseCase extends NoParamsUseCase<List<PomodoroSessionEntity>> {
  final PomodoroSessionRepository repository;

  GetAllPomodoroSessionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<PomodoroSessionEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all PomodoroSessions: ${e.toString()}', e));
    }
  }
}

