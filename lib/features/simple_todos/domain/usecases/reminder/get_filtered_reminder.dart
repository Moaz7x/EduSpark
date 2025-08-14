import '../../entities/reminder_entity.dart';
import '../../repositories/reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving filtered Reminder entities.
///
/// This use case handles the business logic for fetching Reminder entities
/// based on specific filter criteria.
/// Returns Either&lt;Failure, List&lt;ReminderEntity&gt;&gt; for functional error handling.
class GetFilteredRemindersUseCase extends BaseUseCase<List<ReminderEntity>, FilterParams> {
  final ReminderRepository repository;

  GetFilteredRemindersUseCase(this.repository);

  @override
  Future<Either<Failure, List<ReminderEntity>>> call(FilterParams params) async {
    // Validate filter parameters
    if (params.filters.isEmpty) {
      try {
        final result = await repository.getAll();
        return result;
      } on RepositoryException catch (e) {
        return Left(RepositoryFailure(e.message, e));
      } catch (e) {
        return Left(UnknownFailure('Failed to get all Reminders: ${e.toString()}', e));
      }
    }

    // Validate that filter keys are valid entity fields
    final validFields = {
      'message',
      'todoId',
      'time',
      'isRecurring',
      'recurrencePattern',
      'createdAt',
    };

    for (final key in params.filters.keys) {
      if (!validFields.contains(key)) {
        return Left(ValidationFailure('Invalid filter field: $key. Valid fields are: ${validFields.join(", ")}'));
      }
      if (params.filters[key] == null) {
        return Left(ValidationFailure('Filter value cannot be null for field: $key'));
      }
    }

    try {
      final result = await repository.getFiltered(params.filters);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get filtered Reminders: ${e.toString()}', e));
    }
  }
}

