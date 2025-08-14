import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Task entities.
///
/// This use case handles the business logic for fetching all available
/// Task entities from the repository.
/// Returns Either&lt;Failure, List&lt;TaskEntity&gt;&gt; for functional error handling.
class GetAllTasksUseCase extends NoParamsUseCase<List<TaskEntity>> {
  final TaskRepository repository;

  GetAllTasksUseCase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Tasks: ${e.toString()}', e));
    }
  }
}

