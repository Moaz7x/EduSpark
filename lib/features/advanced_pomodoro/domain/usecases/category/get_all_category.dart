import '../../entities/category_entity.dart';
import '../../repositories/category_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all Category entities.
///
/// This use case handles the business logic for fetching all available
/// Category entities from the repository.
/// Returns Either&lt;Failure, List&lt;CategoryEntity&gt;&gt; for functional error handling.
class GetAllCategorysUseCase extends NoParamsUseCase<List<CategoryEntity>> {
  final CategoryRepository repository;

  GetAllCategorysUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all Categorys: ${e.toString()}', e));
    }
  }
}

