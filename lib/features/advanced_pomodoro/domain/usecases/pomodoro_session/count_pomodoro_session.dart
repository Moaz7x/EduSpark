import '../../repositories/pomodoro_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for counting PomodoroSession entities.
///
/// This use case handles the business logic for getting the total
/// count of PomodoroSession entities in the system.
/// Returns Either&lt;Failure, int&gt; for functional error handling.
class CountPomodoroSessionsUseCase extends NoParamsUseCase<int> {
  final PomodoroSessionRepository repository;

  CountPomodoroSessionsUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call() async {
    try {
      final result = await repository.count();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to count PomodoroSessions: ${e.toString()}', e));
    }
  }
}

