import '../../entities/statistics_entity.dart';
import '../../repositories/statistics_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for creating a new Statistics entity.
///
/// This use case encapsulates the business logic for creating a Statistics,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, StatisticsEntity&gt; for functional error handling.
class CreateStatisticsUseCase extends BaseUseCase<StatisticsEntity, StatisticsEntity> {
  final StatisticsRepository repository;

  CreateStatisticsUseCase(this.repository);

  @override
  Future<Either<Failure, StatisticsEntity>> call(StatisticsEntity params) async {
    // Validate entity before creation
    final validationResult = _validateEntity(params);
    if (validationResult != null) {
      return Left(validationResult);
    }

    try {
      final result = await repository.create(params);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to create Statistics: ${e.toString()}', e));
    }
  }

  /// Validates the Statistics entity before creation.
  ValidationFailure? _validateEntity(StatisticsEntity entity) {
    if (entity.totalPomodorosCompleted.isEmpty) {
      return ValidationFailure('total omodoros ompleted cannot be empty');
    }
    if (entity.totalFocusTimeMinutes == null) {
      return ValidationFailure('total ocus ime inutes is required');
    }
    if (entity.totalBreakTimeMinutes == null) {
      return ValidationFailure('total reak ime inutes is required');
    }
    if (entity.lastSessionAt.isEmpty) {
      return ValidationFailure('last ession t cannot be empty');
    }
    return null; // No validation errors
  }
}

