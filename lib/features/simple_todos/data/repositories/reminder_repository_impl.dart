import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/types/either.dart';
import '../../../../core/types/failures.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/reminder_entity.dart';
import '../../domain/repositories/reminder_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/todo_model.dart';
import '../models/subtask_model.dart';
import '../models/reminder_model.dart';


/// Repository implementation for Reminder feature.
///
/// This implementation provides concrete data access operations
/// by coordinating between the domain layer and data sources.
/// All methods return Either<Failure, T> for functional error handling.
class ReminderRepositoryImpl implements ReminderRepository {
  final LocalDataSource localDataSource;

  ReminderRepositoryImpl(this.localDataSource);

  static const String _entityType = 'reminder';

  @override
  Future<Either<Failure, ReminderEntity>> create(ReminderEntity entity) async {
    try {
      final model = ReminderModel.fromEntity(entity);
      final result = await localDataSource.create<ReminderModel>(model);
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
  Future<Either<Failure, ReminderEntity?>> getById(int id) async {
    try {
      final result = await localDataSource.getById<ReminderModel>(id, _entityType);
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
  Future<Either<Failure, List<ReminderEntity>>> getAll() async {
    try {
      final result = await localDataSource.getAll<ReminderModel>(_entityType);
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
  Future<Either<Failure, ReminderEntity>> update(ReminderEntity entity) async {
    try {
      final model = ReminderModel.fromEntity(entity);
      final result = await localDataSource.update<ReminderModel>(model);
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
  Future<Either<Failure, List<ReminderEntity>>> getByField(
      String fieldName, dynamic value) async {
    try {
      final filters = {fieldName: value};
      final result =
          await localDataSource.getFiltered<ReminderModel>(filters, _entityType);
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
  Future<Either<Failure, List<ReminderEntity>>> search(String query) async {
    try {
      final result =
          await localDataSource.search<ReminderModel>(query, _entityType);
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
  Future<Either<Failure, List<ReminderEntity>>> getPaginated(
      int page, int limit) async {
    try {
      final result = await localDataSource.getPaginated<ReminderModel>(
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
  Future<Either<Failure, List<ReminderEntity>>> getFiltered(
      Map<String, dynamic> filters) async {
    try {
      final result =
          await localDataSource.getFiltered<ReminderModel>(filters, _entityType);
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

  @override

  /// Loads the entity with all its relationships.
  Future<Either<Failure, ReminderEntity>> loadWithRelationships(
      ReminderEntity entity) async {
    try {
      final model = ReminderModel.fromEntity(entity);
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
  Future<Either<Failure, bool>> saveWithRelationships(ReminderEntity entity,
      {List<dynamic>? childEntities}) async {
    try {
      final model = ReminderModel.fromEntity(entity);
      List<dynamic>? childModels;
      if (childEntities != null) {
        childModels = childEntities.map((child) {
          // Convert child entities to models based on their type
          if (child is TodoEntity) {
            return TodoModel.fromEntity(child);
          }
          if (child is SubtaskEntity) {
            return SubtaskModel.fromEntity(child);
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

