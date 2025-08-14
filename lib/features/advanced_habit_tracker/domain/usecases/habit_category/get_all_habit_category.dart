import '../../entities/habit_category_entity.dart';
import '../../repositories/habit_category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all HabitCategory entities.
///
/// This use case handles the business logic for fetching all available
/// HabitCategory entities from the repository.
/// Returns Either&lt;Failure, List&lt;HabitCategoryEntity&gt;&gt; for functional error handling.
class GetAllHabitCategorysUseCase extends NoParamsUseCase<List<HabitCategoryEntity>> {
  final HabitCategoryRepository repository;

  GetAllHabitCategorysUseCase(this.repository);

  @override
  Future<Either<Failure, List<HabitCategoryEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all HabitCategorys: ${e.toString()}', e));
    }
  }
}

