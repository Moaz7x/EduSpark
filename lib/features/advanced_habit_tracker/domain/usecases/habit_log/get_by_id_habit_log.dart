import '../../entities/habit_log_entity.dart';
import '../../repositories/habit_log_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a HabitLog entity by ID.
///
/// This use case handles the business logic for fetching a specific HabitLog
/// by its unique identifier.
/// Returns Either&lt;Failure, HabitLogEntity?&gt; for functional error handling.
class GetHabitLogByIdUseCase extends BaseUseCase<HabitLogEntity?, IdParams> {
  final HabitLogRepository repository;

  GetHabitLogByIdUseCase(this.repository);

  @override
  Future<Either<Failure, HabitLogEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get HabitLog by ID: ${e.toString()}', e));
    }
  }
}

