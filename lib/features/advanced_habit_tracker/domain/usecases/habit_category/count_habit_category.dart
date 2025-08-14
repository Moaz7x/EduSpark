import '../../repositories/habit_category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for counting HabitCategory entities.
///
/// This use case handles the business logic for getting the total
/// count of HabitCategory entities in the system.
/// Returns Either&lt;Failure, int&gt; for functional error handling.
class CountHabitCategorysUseCase extends NoParamsUseCase<int> {
  final HabitCategoryRepository repository;

  CountHabitCategorysUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call() async {
    try {
      final result = await repository.count();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to count HabitCategorys: ${e.toString()}', e));
    }
  }
}

