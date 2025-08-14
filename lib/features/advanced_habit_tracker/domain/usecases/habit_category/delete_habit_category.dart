import '../../repositories/habit_category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for deleting a HabitCategory entity.
///
/// This use case handles the business logic for removing a HabitCategory
/// entity from the system.
/// Returns Either&lt;Failure, bool&gt; for functional error handling.
class DeleteHabitCategoryUseCase extends BaseUseCase<bool, IdParams> {
  final HabitCategoryRepository repository;

  DeleteHabitCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(IdParams params) async {
    // Validate ID parameter
    if (params.id <= 0) {
      return Left(ValidationFailure('ID must be greater than 0'));
    }

    try {
      // Check if entity exists before deleting
      final existsResult = await repository.exists(params.id);
      return existsResult.fold(
        (failure) => Left(failure),
        (exists) {
          if (!exists) {
            return Left(
                ValidationFailure('HabitCategory with ID ${params.id} does not exist'));
          }

          // Continue with deletion if entity exists
          return _performDelete(params.id);
        },
      );
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to delete HabitCategory: ${e.toString()}', e));
    }
  }

  Future<Either<Failure, bool>> _performDelete(int id) async {
    try {
      final result = await repository.delete(id);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to delete HabitCategory: ${e.toString()}', e));
    }
  }
}

