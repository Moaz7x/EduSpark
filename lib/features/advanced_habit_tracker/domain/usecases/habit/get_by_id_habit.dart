import '../../entities/habit_entity.dart';
import '../../repositories/habit_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a Habit entity by ID.
///
/// This use case handles the business logic for fetching a specific Habit
/// by its unique identifier.
/// Returns Either&lt;Failure, HabitEntity?&gt; for functional error handling.
class GetHabitByIdUseCase extends BaseUseCase<HabitEntity?, IdParams> {
  final HabitRepository repository;

  GetHabitByIdUseCase(this.repository);

  @override
  Future<Either<Failure, HabitEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get Habit by ID: ${e.toString()}', e));
    }
  }
}

