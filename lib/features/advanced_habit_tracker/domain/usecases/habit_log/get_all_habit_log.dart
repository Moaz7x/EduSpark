import '../../entities/habit_log_entity.dart';
import '../../repositories/habit_log_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all HabitLog entities.
///
/// This use case handles the business logic for fetching all available
/// HabitLog entities from the repository.
/// Returns Either&lt;Failure, List&lt;HabitLogEntity&gt;&gt; for functional error handling.
class GetAllHabitLogsUseCase extends NoParamsUseCase<List<HabitLogEntity>> {
  final HabitLogRepository repository;

  GetAllHabitLogsUseCase(this.repository);

  @override
  Future<Either<Failure, List<HabitLogEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all HabitLogs: ${e.toString()}', e));
    }
  }
}

