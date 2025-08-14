import '../../entities/statistics_entity.dart';
import '../../repositories/statistics_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for updating an existing Statistics entity.
///
/// This use case encapsulates the business logic for updating a Statistics,
/// including validation and coordination with the repository layer.
/// Returns Either&lt;Failure, StatisticsEntity&gt; for functional error handling.
class UpdateStatisticsUseCase extends BaseUseCase<StatisticsEntity, UpdateParams<StatisticsEntity>> {
  final StatisticsRepository repository;

  UpdateStatisticsUseCase(this.repository);

  @override
  Future<Either<Failure, StatisticsEntity>> call(UpdateParams<StatisticsEntity> params) async {
    // Validate the ID parameter
    if (params.id <= 0) {
      return Left(ValidationFailure('ID must be greater than 0 for update operation'));
    }

    // Validate entity fields
    final validationResult = _validateEntity(params.entity);
    if (validationResult != null) {
      return Left(validationResult);
    }

    try {
      // Check if entity exists before updating
      final existsResult = await repository.exists(params.id);
      final exists = existsResult.fold(
        (failure) => false,
        (exists) => exists,
      );
      if (!exists) {
        return Left(ValidationFailure('Statistics with ID ${params.id} does not exist'));
      }

      final result = await repository.update(params.entity);
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to update Statistics: ${e.toString()}', e));
    }
  }

  /// Validates the Statistics entity before update.
  ValidationFailure? _validateEntity(StatisticsEntity entity) {
    if (entity.totalPomodorosCompleted.isEmpty) {
      return ValidationFailure('total pomodoros completed cannot be empty');
    }
    if (entity.totalFocusTimeMinutes == null) {
      return ValidationFailure('total focus time minutes is required');
    }
    if (entity.totalBreakTimeMinutes == null) {
      return ValidationFailure('total break time minutes is required');
    }
    if (entity.lastSessionAt.isEmpty) {
      return ValidationFailure('last session at cannot be empty');
    }
    return null; // No validation errors
  }
}

