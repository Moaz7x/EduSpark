import '../../entities/habit_category_entity.dart';
import '../../repositories/habit_category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a HabitCategory entity by ID.
///
/// This use case handles the business logic for fetching a specific HabitCategory
/// by its unique identifier.
/// Returns Either&lt;Failure, HabitCategoryEntity?&gt; for functional error handling.
class GetHabitCategoryByIdUseCase extends BaseUseCase<HabitCategoryEntity?, IdParams> {
  final HabitCategoryRepository repository;

  GetHabitCategoryByIdUseCase(this.repository);

  @override
  Future<Either<Failure, HabitCategoryEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get HabitCategory by ID: ${e.toString()}', e));
    }
  }
}

