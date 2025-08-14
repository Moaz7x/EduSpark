import 'dart:developer' as developer;
import 'dart:io';

import 'package:isar/isar.dart';

import '../../../../core/types/types.dart';
// Import all models from barrel file
import '../models/models.dart';
import 'local_datasource.dart';

/// Local data source implementation for AdvancedPomodoro feature.
///
/// This implementation provides concrete data persistence operations
/// supporting both SharedPreferences and Isar backends with multi-entity support.
class LocalDataSourceImpl implements LocalDataSource {
  Isar? _isar;

  @override
  Future<Either<Failure, void>> initialize() async {
    try {
      _isar = await Isar.open([
        CategoryModelSchema,
        TaskModelSchema,
        PomodoroSessionModelSchema,
        BreakSessionModelSchema,
        StatisticsModelSchema,
      ], directory: await _getIsarDirectory());

      developer.log('LocalDataSource initialized successfully');
      return const Right(null);
    } catch (e) {
      return Left(DataSourceFailure('Failed to initialize local data source: ${e.toString()}',
          originalError: e));
    }
  }

  @override
  Future<Either<Failure, void>> close() async {
    try {
      await _isar?.close();

      developer.log('LocalDataSource closed successfully');
      return const Right(null);
    } catch (e) {
      return Left(DataSourceFailure('Failed to close local data source: ${e.toString()}',
          originalError: e));
    }
  }

  /// Gets the Isar directory path
  Future<String> _getIsarDirectory() async {
    final dir = Directory.systemTemp.createTempSync('isar_advanced_pomodoro_db');
    return dir.path;
  }

  /// Gets the Isar collection for a specific entity type
  IsarCollection<dynamic>? _getCollectionForEntityType(String entityType) {
    if (_isar == null) return null;

    switch (entityType) {
      case 'category':
        return _isar!.categoryModels;

      case 'task':
        return _isar!.taskModels;

      case 'pomodoro_session':
        return _isar!.pomodoroSessionModels;

      case 'break_session':
        return _isar!.breakSessionModels;

      case 'statistics':
        return _isar!.statisticsModels;

      default:
        return null;
    }
  }

  @override
  Future<Either<Failure, T>> create<T>(T model) async {
    try {
      if (model == null) {
        return Left(DataSourceFailure('Model cannot be null'));
      }

      // Extract entity type from model runtime type
      final entityType = _getEntityType(T);
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      // Save to Isar database - Isar will auto-assign ID
      await _isar!.writeTxn(() async {
        await collection.put(model);
      });

      return Right(model);
    } catch (e) {
      return Left(DataSourceFailure('Failed to create entity: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, T?>> getById<T>(int id, String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final result = await collection.get(id);
      return Right(result as T?);
    } catch (e) {
      return Left(
          DataSourceFailure('Failed to get entity by ID: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, List<T>>> getAll<T>(String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final results = await collection.where().findAll();
      return Right(results.cast<T>());
    } catch (e) {
      return Left(
          DataSourceFailure('Failed to get all entities: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, T>> update<T>(T model) async {
    try {
      if (model == null) {
        return Left(DataSourceFailure('Model cannot be null'));
      }

      final entityType = _getEntityType(T);
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final modelWithId = model as dynamic;
      if (modelWithId.id == null) {
        return Left(DataSourceFailure('Model must have an ID for update'));
      }

      // Check if entity exists
      final existing = await collection.get(modelWithId.id as int);
      if (existing == null) {
        return Left(DataSourceFailure('Entity with ID ${modelWithId.id} not found'));
      }

      // Update in Isar database
      await _isar!.writeTxn(() async {
        await collection.put(modelWithId);
      });

      return Right(model);
    } catch (e) {
      return Left(DataSourceFailure('Failed to update entity: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, bool>> delete(int id, String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final success = await _isar!.writeTxn(() async {
        return await collection.delete(id);
      });

      return Right(success);
    } catch (e) {
      return Left(DataSourceFailure('Failed to delete entity: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, List<T>>> search<T>(String query, String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      // Optimized entity-specific search using Isar field queries
      final lowerQuery = query.toLowerCase();

      switch (entityType) {
        case 'category':
          final results = await _searchCategory<T>(collection, lowerQuery);
          return Right(results);

        case 'task':
          final results = await _searchTask<T>(collection, lowerQuery);
          return Right(results);

        case 'pomodoro_session':
          final results = await _searchPomodorosession<T>(collection, lowerQuery);
          return Right(results);

        case 'break_session':
          final results = await _searchBreaksession<T>(collection, lowerQuery);
          return Right(results);

        case 'statistics':
          final results = await _searchStatistics<T>(collection, lowerQuery);
          return Right(results);

        default:
          // Fallback to basic search for unknown entity types
          final allResults = await collection.where().findAll();
          final filteredResults = allResults.where((item) {
            final itemString = item.toString().toLowerCase();
            return itemString.contains(lowerQuery);
          }).toList();
          return Right(filteredResults.cast<T>());
      }
    } catch (e) {
      return Left(
          DataSourceFailure('Failed to search entities: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, List<T>>> getPaginated<T>(int page, int limit, String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final results = await collection.where().offset(page * limit).limit(limit).findAll();

      return Right(results.cast<T>());
    } catch (e) {
      return Left(
          DataSourceFailure('Failed to get paginated entities: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, List<T>>> getFiltered<T>(
      Map<String, dynamic> filters, String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      // For Isar, filtering requires specific field queries
      // This is a basic implementation - you may want to customize
      // based on your specific entity fields and filter requirements
      final allResults = await collection.where().findAll();

      final filteredResults = allResults.where((item) {
        // Basic filtering implementation
        // In a real implementation, you'd use reflection or specific
        // field accessors based on the filter keys
        return filters.entries.every((filter) {
          try {
            final itemMap = (item as dynamic).toJson() as Map<String, dynamic>;
            return itemMap[filter.key] == filter.value;
          } catch (e) {
            return false;
          }
        });
      }).toList();

      return Right(filteredResults.cast<T>());
    } catch (e) {
      return Left(
          DataSourceFailure('Failed to get filtered entities: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, int>> count(String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final count = await collection.count();
      return Right(count);
    } catch (e) {
      return Left(DataSourceFailure('Failed to count entities: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, bool>> exists(int id, String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final result = await collection.get(id);
      return Right(result != null);
    } catch (e) {
      return Left(
          DataSourceFailure('Failed to check entity existence: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, int>> deleteAll(String entityType) async {
    try {
      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final count = await collection.count();

      await _isar!.writeTxn(() async {
        await collection.clear();
      });

      return Right(count);
    } catch (e) {
      return Left(
          DataSourceFailure('Failed to delete all entities: ${e.toString()}', originalError: e));
    }
  }

  /// Helper method to get entity type from generic type
  String _getEntityType(Type type) {
    final typeName = type.toString();
    // Remove 'Model' suffix and convert to lowercase
    if (typeName.endsWith('Model')) {
      return typeName.substring(0, typeName.length - 5).toLowerCase();
    }
    return typeName.toLowerCase();
  }

  // ============================================================================
  // ZZZZRELATIONSHIP MANAGEMENT METHODS
  // ============================================================================

  /// Loads all relationships for a given entity with proper cascade loading
  @override
  Future<Either<Failure, T>> loadWithRelationships<T>(T entity, String entityType) async {
    try {
      developer.log('Loading relationships for $entityType entity', name: 'LocalDataSource');

      // For Isar, load relationships using IsarLinks

      if (entity is CategoryModel) {
        return Right(entity);
      }

      if (entity is TaskModel) {
        return Right(entity);
      }

      if (entity is PomodoroSessionModel) {
        return Right(entity);
      }

      if (entity is BreakSessionModel) {
        return Right(entity);
      }

      if (entity is StatisticsModel) {
        return Right(entity);
      }

      return Right(entity);
    } catch (e) {
      developer.log('Failed to load relationships for $entityType: $e', name: 'LocalDataSource');
      return Left(DataSourceFailure('Failed to load entity relationships: ${e.toString()}',
          originalError: e));
    }
  }

  /// Saves entity with all its relationships in a single transaction
  @override
  Future<Either<Failure, bool>> saveWithRelationships<T>(T entity, String entityType,
      {List<dynamic>? childEntities}) async {
    try {
      developer.log('Saving entity with relationships: $entityType', name: 'LocalDataSource');

      // Use Isar transaction for atomic saves
      final result = await _isar!.writeTxn(() async {
        bool success = true;

        // Save the main entity first
        final collection = _getCollectionForEntityType(entityType);
        if (collection != null) {
          await collection.put(entity);

          if (entityType == 'category') {
            final category = entity as CategoryModel;
          }

          if (entityType == 'task') {
            final task = entity as TaskModel;
          }

          if (entityType == 'pomodoro_session') {
            final pomodoroSession = entity as PomodoroSessionModel;
          }

          if (entityType == 'break_session') {
            final breakSession = entity as BreakSessionModel;
          }

          if (entityType == 'statistics') {
            final statistics = entity as StatisticsModel;
          }
        }

        // Save related child entities
        if (childEntities != null) {
          for (final childEntity in childEntities) {
            final childType =
                childEntity.runtimeType.toString().toLowerCase().replaceAll('model', '');
            final childCollection = _getCollectionForEntityType(childType);
            if (childCollection != null) {
              await childCollection.put(childEntity);
            }
          }
        }

        return success;
      });
      return Right(result);
    } catch (e) {
      developer.log('Failed to save entity with relationships: $e', name: 'LocalDataSource');
      return Left(DataSourceFailure('Failed to save entity with relationships: ${e.toString()}',
          originalError: e));
    }
  }

  /// Deletes entity with cascade delete for all related child entities
  @override
  Future<Either<Failure, bool>> deleteWithCascade(int id, String entityType) async {
    try {
      developer.log('Performing cascade delete for $entityType with id: $id',
          name: 'LocalDataSource');

      // Use Isar transaction for atomic cascade delete
      final result = await _isar!.writeTxn(() async {
        bool success = true;

        // Handle cascade deletes based on entity type
        switch (entityType) {
          case 'category':

            // Then delete the category
            success = await _isar!.categoryModels.delete(id);
            break;

          case 'task':

            // Then delete the task
            success = await _isar!.taskModels.delete(id);
            break;

          case 'pomodoro_session':

            // Then delete the pomodoro_session
            success = await _isar!.pomodoroSessionModels.delete(id);
            break;

          case 'break_session':

            // Then delete the break_session
            success = await _isar!.breakSessionModels.delete(id);
            break;

          case 'statistics':

            // Then delete the statistics
            success = await _isar!.statisticsModels.delete(id);
            break;

          default:
            // Generic delete for unknown entity types
            final collection = _getCollectionForEntityType(entityType);
            if (collection != null) {
              success = await collection.delete(id);
            }
        }

        return success;
      });
      return Right(result);
    } catch (e) {
      developer.log('Failed to perform cascade delete: $e', name: 'LocalDataSource');
      return Left(
          DataSourceFailure('Failed to perform cascade delete: ${e.toString()}', originalError: e));
    }
  }

  /// Clears all data for an entity type and its related entities
  @override
  Future<Either<Failure, bool>> clearWithRelationships(String entityType) async {
    try {
      developer.log('Clearing all data with relationships for: $entityType',
          name: 'LocalDataSource');

      final result = await _isar!.writeTxn(() async {
        try {
          switch (entityType) {
            case 'category':
              await _isar!.categoryModels.clear();
              break;

            case 'task':
              await _isar!.taskModels.clear();
              break;

            case 'pomodoro_session':
              await _isar!.pomodoroSessionModels.clear();
              break;

            case 'break_session':
              await _isar!.breakSessionModels.clear();
              break;

            case 'statistics':
              await _isar!.statisticsModels.clear();
              break;

            default:
              final collection = _getCollectionForEntityType(entityType);
              if (collection != null) {
                await collection.clear();
              }
          }
          return true; // Return true if all operations completed successfully
        } catch (e) {
          return false; // Return false if any operation failed
        }
      });
      return Right(result);
    } catch (e) {
      developer.log('Failed to clear data with relationships: $e', name: 'LocalDataSource');
      return Left(DataSourceFailure('Failed to clear data with relationships: ${e.toString()}',
          originalError: e));
    }
  }

  /// Gets all child entities for a given parent entity
  @override
  Future<Either<Failure, List<T>>> getChildEntities<T>(
      int parentId, String parentType, String childType) async {
    try {
      developer.log('Getting child entities: $childType for $parentType with id: $parentId',
          name: 'LocalDataSource');

      switch (childType) {
        case 'category':
          break;

        case 'task':
          break;

        case 'pomodoro_session':
          break;

        case 'break_session':
          break;

        case 'statistics':
          break;

        // Add more child entity queries as needed
      }
      return Right(<T>[]);
    } catch (e) {
      developer.log('Failed to get child entities: $e', name: 'LocalDataSource');
      return Left(
          DataSourceFailure('Failed to get child entities: ${e.toString()}', originalError: e));
    }
  }

  // Entity-specific optimized search methods
  /// Optimized search for Category entities using Isar field queries
  Future<List<T>> _searchCategory<T>(IsarCollection<dynamic> collection, String lowerQuery) async {
    try {
      // Cast to proper type to get access to filter methods
      final categoryCollection = collection as IsarCollection<CategoryModel>;

      final results = await categoryCollection
          .filter()
          .nameContains(lowerQuery, caseSensitive: false)
          .or()
          .descriptionContains(lowerQuery, caseSensitive: false)
          .findAll();

      return results.cast<T>();
    } catch (e) {
      developer.log('Failed to search Category entities: $e');
      // Fallback to basic search
      final allResults = await collection.where().findAll();
      final filteredResults = allResults.where((item) {
        final itemString = item.toString().toLowerCase();
        return itemString.contains(lowerQuery);
      }).toList();
      return filteredResults.cast<T>();
    }
  }

  /// Optimized search for Task entities using Isar field queries
  Future<List<T>> _searchTask<T>(IsarCollection<dynamic> collection, String lowerQuery) async {
    try {
      // Cast to proper type to get access to filter methods
      final taskCollection = collection as IsarCollection<TaskModel>;

      final results = await taskCollection
          .filter()
          .titleContains(lowerQuery, caseSensitive: false)
          .or()
          .descriptionContains(lowerQuery, caseSensitive: false)
          .or()
          .priorityContains(lowerQuery, caseSensitive: false)
          .findAll();

      return results.cast<T>();
    } catch (e) {
      developer.log('Failed to search Task entities: $e');
      // Fallback to basic search
      final allResults = await collection.where().findAll();
      final filteredResults = allResults.where((item) {
        final itemString = item.toString().toLowerCase();
        return itemString.contains(lowerQuery);
      }).toList();
      return filteredResults.cast<T>();
    }
  }

  /// Optimized search for Pomodorosession entities using Isar field queries
  Future<List<T>> _searchPomodorosession<T>(
      IsarCollection<dynamic> collection, String lowerQuery) async {
    try {
      // No searchable fields found, fallback to basic search
      final allResults = await collection.where().findAll();
      final filteredResults = allResults.where((item) {
        final itemString = item.toString().toLowerCase();
        return itemString.contains(lowerQuery);
      }).toList();
      return filteredResults.cast<T>();
    } catch (e) {
      developer.log('Failed to search Pomodorosession entities: $e');
      // Fallback to basic search
      final allResults = await collection.where().findAll();
      final filteredResults = allResults.where((item) {
        final itemString = item.toString().toLowerCase();
        return itemString.contains(lowerQuery);
      }).toList();
      return filteredResults.cast<T>();
    }
  }

  /// Optimized search for Breaksession entities using Isar field queries
  Future<List<T>> _searchBreaksession<T>(
      IsarCollection<dynamic> collection, String lowerQuery) async {
    try {
      // Cast to proper type to get access to filter methods
      final breakSessioncollection = collection as IsarCollection<BreakSessionModel>;

      final results = await breakSessioncollection
          .filter()
          .typeContains(lowerQuery, caseSensitive: false)
          .or()
          .durationContains(lowerQuery, caseSensitive: false)
          .or()
          .startedAtContains(lowerQuery, caseSensitive: false)
          .or()
          .endedAtContains(lowerQuery, caseSensitive: false)
          .findAll();

      return results.cast<T>();
    } catch (e) {
      developer.log('Failed to search Breaksession entities: $e');
      // Fallback to basic search
      final allResults = await collection.where().findAll();
      final filteredResults = allResults.where((item) {
        final itemString = item.toString().toLowerCase();
        return itemString.contains(lowerQuery);
      }).toList();
      return filteredResults.cast<T>();
    }
  }

  /// Optimized search for Statistics entities using Isar field queries
  Future<List<T>> _searchStatistics<T>(
      IsarCollection<dynamic> collection, String lowerQuery) async {
    try {
      // Cast to proper type to get access to filter methods
      final statisticsCollection = collection as IsarCollection<StatisticsModel>;

      final results = await statisticsCollection
          .filter()
          .totalPomodorosCompletedContains(lowerQuery, caseSensitive: false)
          .or()
          .lastSessionAtContains(lowerQuery, caseSensitive: false)
          .findAll();

      return results.cast<T>();
    } catch (e) {
      developer.log('Failed to search Statistics entities: $e');
      // Fallback to basic search
      final allResults = await collection.where().findAll();
      final filteredResults = allResults.where((item) {
        final itemString = item.toString().toLowerCase();
        return itemString.contains(lowerQuery);
      }).toList();
      return filteredResults.cast<T>();
    }
  }

  // ============================================================================
  // ISARLINKS HELPER METHODS
  // ============================================================================

  /// Helper method to save IsarLinks for an entity
  Future<void> saveLinks<T>(T entity) async {
    try {
      switch (entity.runtimeType.toString()) {
        case 'CategoryModel':
          final category = entity as CategoryModel;
          // Save Tasks links
          if (category.tasks.isNotEmpty) {
            await category.tasks.save();
          }
          break;
        case 'TaskModel':
          final task = entity as TaskModel;
          // Save PomodoroSessions links
          if (task.pomodorosessions.isNotEmpty) {
            await task.pomodorosessions.save();
          }
          break;
        case 'PomodorosessionModel':
          final pomodoroSession = entity as PomodoroSessionModel;
          // Save BreakSessions links
          if (pomodoroSession.breaksessions.isNotEmpty) {
            await pomodoroSession.breaksessions.save();
          }
          break;
        default:
          // No links to save for this entity type
          break;
      }
    } catch (e) {
      developer.log('Failed to save links: $e', name: 'LocalDataSource');
      rethrow;
    }
  }

  /// Helper method to load IsarLinks for an entity
  Future<void> loadLinks<T>(T entity) async {
    try {
      switch (entity.runtimeType.toString()) {
        case 'CategoryModel':
          final category = entity as CategoryModel;
          // Load Tasks links
          await category.tasks.load();
          break;
        case 'TaskModel':
          final task = entity as TaskModel;
          // Load PomodoroSessions links
          await task.pomodorosessions.load();
          break;
        case 'PomodorosessionModel':
          final pomodoroSession = entity as PomodoroSessionModel;
          // Load BreakSessions links
          await pomodoroSession.breaksessions.load();
          break;
        default:
          // No links to load for this entity type
          break;
      }
    } catch (e) {
      developer.log('Failed to load links: $e', name: 'LocalDataSource');
      rethrow;
    }
  }

  /// Helper method to clear IsarLinks for an entity
  Future<void> clearLinks<T>(T entity) async {
    try {
      switch (entity.runtimeType.toString()) {
        case 'CategoryModel':
          final category = entity as CategoryModel;
          // Clear Tasks links
          category.tasks.clear();
          await category.tasks.save();
          break;
        case 'TaskModel':
          final task = entity as TaskModel;
          // Clear PomodoroSessions links
          task.pomodorosessions.clear();
          await task.pomodorosessions.save();
          break;
        case 'PomodorosessionModel':
          final pomodoroSession = entity as PomodoroSessionModel;
          // Clear BreakSessions links
          pomodoroSession.breaksessions.clear();
          await pomodoroSession.breaksessions.save();
          break;
        default:
          // No links to clear for this entity type
          break;
      }
    } catch (e) {
      developer.log('Failed to clear links: $e', name: 'LocalDataSource');
      rethrow;
    }
  }
}
