import '../../entities/subtask_entity.dart';
import '../../repositories/subtask_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Subtask entities.
///
/// This use case handles the business logic for fetching all available
/// Subtask entities from the repository.
/// Returns Either&lt;Failure, List&lt;SubtaskEntity&gt;&gt; for functional error handling.
class GetAllSubtasksUseCase extends NoParamsUseCase<List<SubtaskEntity>> {
  final SubtaskRepository repository;

  GetAllSubtasksUseCase(this.repository);

  @override
  Future<Either<Failure, List<SubtaskEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Subtasks: ${e.toString()}', e));
    }
  }
}

