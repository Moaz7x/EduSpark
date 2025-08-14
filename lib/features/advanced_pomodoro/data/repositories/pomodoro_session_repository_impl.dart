import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/types/either.dart';
import '../../../../core/types/failures.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/entities/pomodoro_session_entity.dart';
import '../../domain/entities/break_session_entity.dart';
import '../../domain/entities/statistics_entity.dart';
import '../../domain/repositories/pomodoro_session_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/category_model.dart';
import '../models/task_model.dart';
import '../models/pomodoro_session_model.dart';
import '../models/break_session_model.dart';
import '../models/statistics_model.dart';


/// Repository implementation for PomodoroSession feature.
///
/// This implementation provides concrete data access operations
/// by coordinating between the domain layer and data sources.
/// All methods return Either<Failure, T> for functional error handling.
class PomodoroSessionRepositoryImpl implements PomodoroSessionRepository {
  final LocalDataSource localDataSource;

  PomodoroSessionRepositoryImpl(this.localDataSource);

  static const String _entityType = 'pomodoro_session';

  @override
  Future<Either<Failure, PomodoroSessionEntity>> create(PomodoroSessionEntity entity) async {
    try {
      final model = PomodoroSessionModel.fromEntity(entity);
      final result = await localDataSource.create<PomodoroSessionModel>(model);
      return result.fold(
        (failure) => Left(failure),
        (createdModel) => Right(createdModel.toEntity()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(
          RepositoryFailure('Unexpected error during create: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PomodoroSessionEntity?>> getById(int id) async {
    try {
      final result = await localDataSource.getById<PomodoroSessionModel>(id, _entityType);
      return result.fold(
        (failure) => Left(failure),
        (model) => Right(model?.toEntity()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during getById: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<PomodoroSessionEntity>>> getAll() async {
    try {
      final result = await localDataSource.getAll<PomodoroSessionModel>(_entityType);
      return result.fold(
        (failure) => Left(failure),
        (models) => Right(models.map((model) => model.toEntity()).toList()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(
          RepositoryFailure('Unexpected error during getAll: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PomodoroSessionEntity>> update(PomodoroSessionEntity entity) async {
    try {
      final model = PomodoroSessionModel.fromEntity(entity);
      final result = await localDataSource.update<PomodoroSessionModel>(model);
      return result.fold(
        (failure) => Left(failure),
        (updatedModel) => Right(updatedModel.toEntity()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(
          RepositoryFailure('Unexpected error during update: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> delete(int id) async {
    try {
      // Use cascade delete to handle related entities automatically
      final result = await localDataSource.deleteWithCascade(id, _entityType);
      return result.fold(
        (failure) => Left(failure),
        (success) => Right(success),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(
          RepositoryFailure('Unexpected error during delete: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<PomodoroSessionEntity>>> getByField(
      String fieldName, dynamic value) async {
    try {
      final filters = {fieldName: value};
      final result =
          await localDataSource.getFiltered<PomodoroSessionModel>(filters, _entityType);
      return result.fold(
        (failure) => Left(failure),
        (models) => Right(models.map((model) => model.toEntity()).toList()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during getByField: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<PomodoroSessionEntity>>> search(String query) async {
    try {
      final result =
          await localDataSource.search<PomodoroSessionModel>(query, _entityType);
      return result.fold(
        (failure) => Left(failure),
        (models) => Right(models.map((model) => model.toEntity()).toList()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(
          RepositoryFailure('Unexpected error during search: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<PomodoroSessionEntity>>> getPaginated(
      int page, int limit) async {
    try {
      final result = await localDataSource.getPaginated<PomodoroSessionModel>(
          page, limit, _entityType);
      return result.fold(
        (failure) => Left(failure),
        (models) => Right(models.map((model) => model.toEntity()).toList()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during getPaginated: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<PomodoroSessionEntity>>> getFiltered(
      Map<String, dynamic> filters) async {
    try {
      final result =
          await localDataSource.getFiltered<PomodoroSessionModel>(filters, _entityType);
      return result.fold(
        (failure) => Left(failure),
        (models) => Right(models.map((model) => model.toEntity()).toList()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during getFiltered: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> count() async {
    try {
      final result = await localDataSource.count(_entityType);
      return result.fold(
        (failure) => Left(failure),
        (count) => Right(count),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(
          RepositoryFailure('Unexpected error during count: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> exists(int id) async {
    try {
      final result = await localDataSource.exists(id, _entityType);
      return result.fold(
        (failure) => Left(failure),
        (exists) => Right(exists),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(
          RepositoryFailure('Unexpected error during exists: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> deleteAll() async {
    try {
      final result = await localDataSource.deleteAll(_entityType);
      return result.fold(
        (failure) => Left(failure),
        (deletedCount) => Right(deletedCount),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during deleteAll: ${e.toString()}'));
    }
  }

  // Relationship methods

  /// Gets all breaksessions for a specific pomodorosession
  Future<List<BreakSessionEntity>> getBreaksessions(int pomodorosessionId) async {
    try {
      final filters = {'pomodorosessionId': pomodorosessionId};
      final result = await localDataSource.getFiltered<BreakSessionModel>(filters, 'break_session');
      return result.fold(
        (failure) => throw RepositoryException(failure.message, null),
        (models) => models.map((BreakSessionModel model) => model.toEntity()).toList(),
      );
    } catch (e) {
      throw RepositoryException('Failed to get breaksessions for PomodoroSession', e);
    }
  }

  @override

  /// Loads the entity with all its relationships.
  Future<Either<Failure, PomodoroSessionEntity>> loadWithRelationships(
      PomodoroSessionEntity entity) async {
    try {
      final model = PomodoroSessionModel.fromEntity(entity);
      final result =
          await localDataSource.loadWithRelationships(model, _entityType);
      return result.fold(
        (failure) => Left(failure),
        (loadedModel) => Right(loadedModel.toEntity()),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during loadWithRelationships: ${e.toString()}'));
    }
  }

  @override

  /// Saves the entity with all its relationships in a single transaction.
  Future<Either<Failure, bool>> saveWithRelationships(PomodoroSessionEntity entity,
      {List<dynamic>? childEntities}) async {
    try {
      final model = PomodoroSessionModel.fromEntity(entity);
      List<dynamic>? childModels;
      if (childEntities != null) {
        childModels = childEntities.map((child) {
          // Convert child entities to models based on their type
          if (child is CategoryEntity) {
            return CategoryModel.fromEntity(child);
          }
          if (child is TaskEntity) {
            return TaskModel.fromEntity(child);
          }
          if (child is BreakSessionEntity) {
            return BreakSessionModel.fromEntity(child);
          }
          if (child is StatisticsEntity) {
            return StatisticsModel.fromEntity(child);
          }
          // Return child as-is if no matching type found
          return child;
        }).toList();
      }
      final result = await localDataSource.saveWithRelationships(
          model, _entityType,
          childEntities: childModels);
      return result.fold(
        (failure) => Left(failure),
        (success) => Right(success),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during saveWithRelationships: ${e.toString()}'));
    }
  }

  @override

  /// Clears all data for this entity type and its related entities.
  Future<Either<Failure, bool>> clearWithRelationships() async {
    try {
      final result = await localDataSource.clearWithRelationships(_entityType);
      return result.fold(
        (failure) => Left(failure),
        (success) => Right(success),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during clearWithRelationships: ${e.toString()}'));
    }
  }

  @override

  /// Gets all child entities for a given parent entity.
  Future<Either<Failure, List<T>>> getChildEntities<T>(
      int parentId, String childType) async {
    try {
      final result = await localDataSource.getChildEntities<T>(
          parentId, _entityType, childType);
      return result.fold(
        (failure) => Left(failure),
        (childEntities) => Right(childEntities),
      );
    } on DataSourceException catch (e) {
      return Left(RepositoryFailure(e.message));
    } catch (e) {
      return Left(RepositoryFailure(
          'Unexpected error during getChildEntities: ${e.toString()}'));
    }
  }

}

