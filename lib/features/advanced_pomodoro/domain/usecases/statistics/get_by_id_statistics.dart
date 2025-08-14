import '../../entities/statistics_entity.dart';
import '../../repositories/statistics_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving a Statistics entity by ID.
///
/// This use case handles the business logic for fetching a specific Statistics
/// by its unique identifier.
/// Returns Either&lt;Failure, StatisticsEntity?&gt; for functional error handling.
class GetStatisticsByIdUseCase extends BaseUseCase<StatisticsEntity?, IdParams> {
  final StatisticsRepository repository;

  GetStatisticsByIdUseCase(this.repository);

  @override
  Future<Either<Failure, StatisticsEntity?>> call(IdParams params) async {
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
      return Left(UnknownFailure('Failed to get Statistics by ID: ${e.toString()}', e));
    }
  }
}

