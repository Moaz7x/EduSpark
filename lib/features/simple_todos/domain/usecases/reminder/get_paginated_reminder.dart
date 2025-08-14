import '../../entities/reminder_entity.dart';
import '../../repositories/reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving paginated Reminder entities.
///
/// This use case handles the business logic for fetching Reminder entities
/// in paginated chunks for efficient data loading.
/// Returns Either&lt;Failure, List&lt;ReminderEntity&gt;&gt; for functional error handling.
class GetPaginatedRemindersUseCase extends BaseUseCase<List<ReminderEntity>, PaginationParams> {
  final ReminderRepository repository;

  GetPaginatedRemindersUseCase(this.repository);

  @override
  Future<Either<Failure, List<ReminderEntity>>> call(PaginationParams params) async {
    // Validate pagination parameters
    if (params.page < 1) {
      return Left(ValidationFailure('Page number must be greater than 0'));
    }
    if (params.limit < 1) {
      return Left(ValidationFailure('Limit must be greater than 0'));
    }
    if (params.limit > 100) {
      return Left(ValidationFailure('Limit cannot exceed 100 items per page'));
    }

    try {
      final result = await repository.getPaginated(params.page, params.limit);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get paginated Reminders: ${e.toString()}', e));
    }
  }
}

