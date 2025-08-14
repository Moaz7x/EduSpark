import '../../entities/reminder_entity.dart';
import '../../repositories/reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Reminder entities.
///
/// This use case handles the business logic for fetching all available
/// Reminder entities from the repository.
/// Returns Either&lt;Failure, List&lt;ReminderEntity&gt;&gt; for functional error handling.
class GetAllRemindersUseCase extends NoParamsUseCase<List<ReminderEntity>> {
  final ReminderRepository repository;

  GetAllRemindersUseCase(this.repository);

  @override
  Future<Either<Failure, List<ReminderEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Reminders: ${e.toString()}', e));
    }
  }
}

