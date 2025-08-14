import '../../repositories/habit_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for counting Habit entities.
///
/// This use case handles the business logic for getting the total
/// count of Habit entities in the system.
/// Returns Either&lt;Failure, int&gt; for functional error handling.
class CountHabitsUseCase extends NoParamsUseCase<int> {
  final HabitRepository repository;

  CountHabitsUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call() async {
    try {
      final result = await repository.count();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to count Habits: ${e.toString()}', e));
    }
  }
}

