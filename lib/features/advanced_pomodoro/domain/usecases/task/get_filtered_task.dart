import '../../entities/task_entity.dart';
import '../../repositories/task_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving filtered Task entities.
///
/// This use case handles the business logic for fetching Task entities
/// based on specific filter criteria.
/// Returns Either&lt;Failure, List&lt;TaskEntity&gt;&gt; for functional error handling.
class GetFilteredTasksUseCase extends BaseUseCase<List<TaskEntity>, FilterParams> {
  final TaskRepository repository;

  GetFilteredTasksUseCase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(FilterParams params) async {
    // Validate filter parameters
    if (params.filters.isEmpty) {
      try {
        final result = await repository.getAll();
        return result;
      } on RepositoryException catch (e) {
        return Left(RepositoryFailure(e.message, e));
      } catch (e) {
        return Left(UnknownFailure('Failed to get all Tasks: ${e.toString()}', e));
      }
    }

    // Validate that filter keys are valid entity fields
    final validFields = {
      'categoryId',
      'title',
      'description',
      'isCompleted',
      'priority',
      'dueDate',
      'createdAt',
      'updatedAt',
      'pomodorosessions',
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
      return Left(UnknownFailure('Failed to get filtered Tasks: ${e.toString()}', e));
    }
  }
}

