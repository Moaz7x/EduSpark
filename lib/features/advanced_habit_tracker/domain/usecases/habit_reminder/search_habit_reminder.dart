import '../../entities/habit_reminder_entity.dart';
import '../../repositories/habit_reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for searching HabitReminder entities with text queries.
///
/// This use case handles the business logic for performing text-based
/// searches across HabitReminder entities.
/// Returns Either&lt;Failure, List&lt;HabitReminderEntity&gt;&gt; for functional error handling.
class SearchHabitRemindersUseCase extends BaseUseCase<List<HabitReminderEntity>, SearchParams> {
  final HabitReminderRepository repository;

  SearchHabitRemindersUseCase(this.repository);

  @override
  Future<Either<Failure, List<HabitReminderEntity>>> call(SearchParams params) async {
    // Validate search parameters
    if (params.query.length < 2 && params.query.trim().isNotEmpty) {
      return Left(ValidationFailure('Search query must be at least 2 characters long'));
    }

    try {
if (params.query.trim().isEmpty) {
        return await repository.getAll();
      } else {
        return await repository.search(params.query.trim());
      }
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to search HabitReminders: ${e.toString()}', e));
    }
  }
}

