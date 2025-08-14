import '../../entities/habit_entity.dart';
import '../../repositories/habit_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Habit entities.
///
/// This use case handles the business logic for fetching all available
/// Habit entities from the repository.
/// Returns Either&lt;Failure, List&lt;HabitEntity&gt;&gt; for functional error handling.
class GetAllHabitsUseCase extends NoParamsUseCase<List<HabitEntity>> {
  final HabitRepository repository;

  GetAllHabitsUseCase(this.repository);

  @override
  Future<Either<Failure, List<HabitEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Habits: ${e.toString()}', e));
    }
  }
}

