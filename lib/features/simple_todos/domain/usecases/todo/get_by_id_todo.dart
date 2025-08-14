import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a Todo entity by ID.
///
/// This use case handles the business logic for fetching a specific Todo
/// by its unique identifier.
/// Returns Either&lt;Failure, TodoEntity?&gt; for functional error handling.
class GetTodoByIdUseCase extends BaseUseCase<TodoEntity?, IdParams> {
  final TodoRepository repository;

  GetTodoByIdUseCase(this.repository);

  @override
  Future<Either<Failure, TodoEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get Todo by ID: ${e.toString()}', e));
    }
  }
}

