import '../../repositories/reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for counting Reminder entities.
///
/// This use case handles the business logic for getting the total
/// count of Reminder entities in the system.
/// Returns Either&lt;Failure, int&gt; for functional error handling.
class CountRemindersUseCase extends NoParamsUseCase<int> {
  final ReminderRepository repository;

  CountRemindersUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call() async {
    try {
      final result = await repository.count();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to count Reminders: ${e.toString()}', e));
    }
  }
}

