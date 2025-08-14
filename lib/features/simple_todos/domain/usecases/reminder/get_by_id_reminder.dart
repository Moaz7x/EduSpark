import '../../entities/reminder_entity.dart';
import '../../repositories/reminder_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a Reminder entity by ID.
///
/// This use case handles the business logic for fetching a specific Reminder
/// by its unique identifier.
/// Returns Either&lt;Failure, ReminderEntity?&gt; for functional error handling.
class GetReminderByIdUseCase extends BaseUseCase<ReminderEntity?, IdParams> {
  final ReminderRepository repository;

  GetReminderByIdUseCase(this.repository);

  @override
  Future<Either<Failure, ReminderEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get Reminder by ID: ${e.toString()}', e));
    }
  }
}

