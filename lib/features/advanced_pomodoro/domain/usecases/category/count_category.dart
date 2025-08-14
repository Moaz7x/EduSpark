import '../../repositories/category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for counting Category entities.
///
/// This use case handles the business logic for getting the total
/// count of Category entities in the system.
/// Returns Either&lt;Failure, int&gt; for functional error handling.
class CountCategorysUseCase extends NoParamsUseCase<int> {
  final CategoryRepository repository;

  CountCategorysUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call() async {
    try {
      final result = await repository.count();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to count Categorys: ${e.toString()}', e));
    }
  }
}

