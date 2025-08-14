import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/types/either.dart';
import '../../../../core/types/failures.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/reminder_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/todo_model.dart';
import '../models/subtask_model.dart';
import '../models/reminder_model.dart';


/// Repository implementation for Todo feature.
///
/// This implementation provides concrete data access operations
/// by coordinating between the domain layer and data sources.
/// All methods return Either<Failure, T> for functional error handling.
class TodoRepositoryImpl implements TodoRepository {
  final LocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  static const String _entityType = 'todo';

  @override
  Future<Either<Failure, TodoEntity>> create(TodoEntity entity) async {
    try {
      final model = TodoModel.fromEntity(entity);
      final result = await localDataSource.create<TodoModel>(model);
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
  Future<Either<Failure, TodoEntity?>> getById(int id) async {
    try {
      final result = await localDataSource.getById<TodoModel>(id, _entityType);
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
  Future<Either<Failure, List<TodoEntity>>> getAll() async {
    try {
      final result = await localDataSource.getAll<TodoModel>(_entityType);
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
  Future<Either<Failure, TodoEntity>> update(TodoEntity entity) async {
    try {
      final model = TodoModel.fromEntity(entity);
      final result = await localDataSource.update<TodoModel>(model);
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
  Future<Either<Failure, List<TodoEntity>>> getByField(
      String fieldName, dynamic value) async {
    try {
      final filters = {fieldName: value};
      final result =
          await localDataSource.getFiltered<TodoModel>(filters, _entityType);
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
  Future<Either<Failure, List<TodoEntity>>> search(String query) async {
    try {
      final result =
          await localDataSource.search<TodoModel>(query, _entityType);
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
  Future<Either<Failure, List<TodoEntity>>> getPaginated(
      int page, int limit) async {
    try {
      final result = await localDataSource.getPaginated<TodoModel>(
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
  Future<Either<Failure, List<TodoEntity>>> getFiltered(
      Map<String, dynamic> filters) async {
    try {
      final result =
          await localDataSource.getFiltered<TodoModel>(filters, _entityType);
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

  /// Gets all subtasks for a specific todo
  Future<List<SubtaskEntity>> getSubtasks(int todoId) async {
    try {
      final filters = {'todoId': todoId};
      final result = await localDataSource.getFiltered<SubtaskModel>(filters, 'subtask');
      return result.fold(
        (failure) => throw RepositoryException(failure.message, null),
        (models) => models.map((SubtaskModel model) => model.toEntity()).toList(),
      );
    } catch (e) {
      throw RepositoryException('Failed to get subtasks for Todo', e);
    }
  }

  /// Gets all reminders for a specific todo
  Future<List<ReminderEntity>> getReminders(int todoId) async {
    try {
      final filters = {'todoId': todoId};
      final result = await localDataSource.getFiltered<ReminderModel>(filters, 'reminder');
      return result.fold(
        (failure) => throw RepositoryException(failure.message, null),
        (models) => models.map((ReminderModel model) => model.toEntity()).toList(),
      );
    } catch (e) {
      throw RepositoryException('Failed to get reminders for Todo', e);
    }
  }

  @override

  /// Loads the entity with all its relationships.
  Future<Either<Failure, TodoEntity>> loadWithRelationships(
      TodoEntity entity) async {
    try {
      final model = TodoModel.fromEntity(entity);
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
  Future<Either<Failure, bool>> saveWithRelationships(TodoEntity entity,
      {List<dynamic>? childEntities}) async {
    try {
      final model = TodoModel.fromEntity(entity);
      List<dynamic>? childModels;
      if (childEntities != null) {
        childModels = childEntities.map((child) {
          // Convert child entities to models based on their type
          if (child is SubtaskEntity) {
            return SubtaskModel.fromEntity(child);
          }
          if (child is ReminderEntity) {
            return ReminderModel.fromEntity(child);
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

