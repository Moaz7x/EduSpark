import '../../entities/pomodoro_session_entity.dart';
import '../../repositories/pomodoro_session_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a PomodoroSession entity by ID.
///
/// This use case handles the business logic for fetching a specific PomodoroSession
/// by its unique identifier.
/// Returns Either&lt;Failure, PomodoroSessionEntity?&gt; for functional error handling.
class GetPomodoroSessionByIdUseCase extends BaseUseCase<PomodoroSessionEntity?, IdParams> {
  final PomodoroSessionRepository repository;

  GetPomodoroSessionByIdUseCase(this.repository);

  @override
  Future<Either<Failure, PomodoroSessionEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get PomodoroSession by ID: ${e.toString()}', e));
    }
  }
}

