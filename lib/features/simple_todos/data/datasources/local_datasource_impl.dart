
import 'dart:io';
import 'package:isar/isar.dart';


import 'dart:developer' as developer;


import '../../../../core/types/types.dart';


import 'local_datasource.dart';
// Import all models from barrel file
import '../models/models.dart';




/// Local data source implementation for SimpleTodos feature.
///
/// This implementation provides concrete data persistence operations
/// supporting both SharedPreferences and Isar backends with multi-entity support.
class LocalDataSourceImpl implements LocalDataSource {


  Isar? _isar;


  @override
  Future<Either<Failure, void>> initialize() async {
    try {


      _isar = await Isar.open([

        TodoModelSchema,

        SubtaskModelSchema,

        ReminderModelSchema,

      ], directory: await _getIsarDirectory());

      developer.log('LocalDataSource initialized successfully');
      return const Right(null);
    } catch (e) {
      return Left(DataSourceFailure('Failed to initialize local data source: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, void>> close() async {
    try {

      await _isar?.close();

      developer.log('LocalDataSource closed successfully');
      return const Right(null);
    } catch (e) {
      return Left(DataSourceFailure('Failed to close local data source: ${e.toString()}', originalError: e));
    }
  }


  /// Gets the Isar directory path
  Future<String> _getIsarDirectory() async {
    final dir = Directory.systemTemp.createTempSync('isar_simple_todos_db');
    return dir.path;
  }



  /// Gets the Isar collection for a specific entity type
  IsarCollection<dynamic>? _getCollectionForEntityType(String entityType) {
    if (_isar == null) return null;

    switch (entityType) {

      case 'todo':
        return _isar!.todoModels;

      case 'subtask':
        return _isar!.subtaskModels;

      case 'reminder':
        return _isar!.reminderModels;

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
      return Left(DataSourceFailure('Failed to get entity by ID: ${e.toString()}', originalError: e));
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
      return Left(DataSourceFailure('Failed to get all entities: ${e.toString()}', originalError: e));
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

        case 'todo':
          final results = await _searchTodo<T>(collection, lowerQuery);
          return Right(results);

        case 'subtask':
          final results = await _searchSubtask<T>(collection, lowerQuery);
          return Right(results);

        case 'reminder':
          final results = await _searchReminder<T>(collection, lowerQuery);
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
      return Left(DataSourceFailure('Failed to search entities: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, List<T>>> getPaginated<T>(int page, int limit, String entityType) async {
    try {


      final collection = _getCollectionForEntityType(entityType);

      if (collection == null) {
        return Left(DataSourceFailure('No collection found for entity type: $entityType'));
      }

      final results = await collection
          .where()
          .offset(page * limit)
          .limit(limit)
          .findAll();

      return Right(results.cast<T>());




    } catch (e) {
      return Left(DataSourceFailure('Failed to get paginated entities: ${e.toString()}', originalError: e));
    }
  }

  @override
  Future<Either<Failure, List<T>>> getFiltered<T>(Map<String, dynamic> filters, String entityType) async {
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
      return Left(DataSourceFailure('Failed to get filtered entities: ${e.toString()}', originalError: e));
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
      return Left(DataSourceFailure('Failed to check entity existence: ${e.toString()}', originalError: e));
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
      return Left(DataSourceFailure('Failed to delete all entities: ${e.toString()}', originalError: e));
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

      if (entity is TodoModel) {
        
        return Right(entity);
      }

      if (entity is SubtaskModel) {
        
        return Right(entity);
      }

      if (entity is ReminderModel) {
        
        return Right(entity);
      }

      return Right(entity);







    } catch (e) {
      developer.log('Failed to load relationships for $entityType: $e', name: 'LocalDataSource');
      return Left(DataSourceFailure('Failed to load entity relationships: ${e.toString()}', originalError: e));
    }
  }

  /// Saves entity with all its relationships in a single transaction
@override
Future<Either<Failure, bool>> saveWithRelationships<T>(T entity, String entityType, {List<dynamic>? childEntities}) async {
  try {
    developer.log('Saving entity with relationships: $entityType', name: 'LocalDataSource');

    // Use Isar transaction for atomic saves
    final result = await _isar!.writeTxn(() async {
      bool success = true;

      // Save the main entity first
      final collection = _getCollectionForEntityType(entityType);
      if (collection != null) {
        await collection.put(entity);

        if (entityType == 'todo') {
          final todo = entity as TodoModel;
          // Save todo relationships
          if (todo.subtasks.isNotEmpty) {
            await todo.subtasks.save();
          }
          if (todo.reminders.isNotEmpty) {
            await todo.reminders.save();
          }
        }

        if (entityType == 'subtask') {
          final subtask = entity as SubtaskModel;
          // Save subtask relationships
          if (subtask.todo.value != null) {
            await subtask.todo.save();
          }
        }

        if (entityType == 'reminder') {
          final reminder = entity as ReminderModel;
          // Save reminder relationships
          if (reminder.todo.value != null) {
            await reminder.todo.save();
          }
        }
      }

      // Save related child entities
      if (childEntities != null) {
        for (final childEntity in childEntities) {
          final childType = childEntity.runtimeType.toString().toLowerCase().replaceAll('model', '');
          final childCollection = _getCollectionForEntityType(childType);
          if (childCollection != null) {
            await childCollection.put(childEntity);
            // Save links for child entities
            await saveLinks(childEntity);
          }
        }
      }

      return success;
    });
    return Right(result);

  } catch (e) {
    developer.log('Failed to save entity with relationships: $e', name: 'LocalDataSource');
    return Left(DataSourceFailure('Failed to save entity with relationships: ${e.toString()}', originalError: e));
  }
}
  /// Deletes entity with cascade delete for all related child entities
  @override
  Future<Either<Failure, bool>> deleteWithCascade(int id, String entityType) async {
    try {
      developer.log('Performing cascade delete for $entityType with id: $id', name: 'LocalDataSource');


      // Use Isar transaction for atomic cascade delete
      final result = await _isar!.writeTxn(() async {
        bool success = true;

        // Handle cascade deletes based on entity type
        switch (entityType) {

          case 'todo':
            
            // Then delete the todo
            success = await _isar!.todoModels.delete(id);
            break;

          case 'subtask':
            
            // Then delete the subtask
            success = await _isar!.subtaskModels.delete(id);
            break;

          case 'reminder':
            
            // Then delete the reminder
            success = await _isar!.reminderModels.delete(id);
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
      return Left(DataSourceFailure('Failed to perform cascade delete: ${e.toString()}', originalError: e));
    }
  }

  /// Clears all data for an entity type and its related entities
  @override
  Future<Either<Failure, bool>> clearWithRelationships(String entityType) async {
    try {
      developer.log('Clearing all data with relationships for: $entityType', name: 'LocalDataSource');


      final result = await _isar!.writeTxn(() async {
        try {
          switch (entityType) {

            case 'todo':
              
              await _isar!.todoModels.clear();
              break;

            case 'subtask':
              
              await _isar!.subtaskModels.clear();
              break;

            case 'reminder':
              
              await _isar!.reminderModels.clear();
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
      return Left(DataSourceFailure('Failed to clear data with relationships: ${e.toString()}', originalError: e));
    }
  }

  /// Gets all child entities for a given parent entity
  @override
  Future<Either<Failure, List<T>>> getChildEntities<T>(int parentId, String parentType, String childType) async {
    try {
      developer.log('Getting child entities: $childType for $parentType with id: $parentId', name: 'LocalDataSource');


      switch (childType) {

        case 'todo':
          
          break;

        case 'subtask':
          
          break;

        case 'reminder':
          
          break;

        // Add more child entity queries as needed
      }
      return Right(<T>[]);







    } catch (e) {
      developer.log('Failed to get child entities: $e', name: 'LocalDataSource');
      return Left(DataSourceFailure('Failed to get child entities: ${e.toString()}', originalError: e));
    }
  }


  // Entity-specific optimized search methods
  /// Optimized search for Todo entities using Isar field queries
  Future<List<T>> _searchTodo<T>(IsarCollection<dynamic> collection, String lowerQuery) async {
    try {
      // Cast to proper type to get access to filter methods
      final todoCollection = collection as IsarCollection<TodoModel>;
      
      final results = await todoCollection
          .filter()
          .titleContains(lowerQuery, caseSensitive: false)
          .or()
          .descriptionContains(lowerQuery, caseSensitive: false)
          .or()
          .priorityContains(lowerQuery, caseSensitive: false)
          .or()
          .orderContains(lowerQuery, caseSensitive: false)
          .findAll();
      
      return results.cast<T>();
    } catch (e) {
      developer.log('Failed to search Todo entities: $e');
      // Fallback to basic search
      final allResults = await collection.where().findAll();
      final filteredResults = allResults.where((item) {
        final itemString = item.toString().toLowerCase();
        return itemString.contains(lowerQuery);
      }).toList();
      return filteredResults.cast<T>();
    }
  }

  /// Optimized search for Subtask entities using Isar field queries
  Future<List<T>> _searchSubtask<T>(IsarCollection<dynamic> collection, String lowerQuery) async {
    try {
      // Cast to proper type to get access to filter methods
      final subtaskCollection = collection as IsarCollection<SubtaskModel>;
      
      final results = await subtaskCollection
          .filter()
          .titleContains(lowerQuery, caseSensitive: false)
          .or()
          .orderContains(lowerQuery, caseSensitive: false)
          .or()
          .estimatedMinutesContains(lowerQuery, caseSensitive: false)
          .or()
          .notesContains(lowerQuery, caseSensitive: false)
          .findAll();
      
      return results.cast<T>();
    } catch (e) {
      developer.log('Failed to search Subtask entities: $e');
      // Fallback to basic search
      final allResults = await collection.where().findAll();
      final filteredResults = allResults.where((item) {
        final itemString = item.toString().toLowerCase();
        return itemString.contains(lowerQuery);
      }).toList();
      return filteredResults.cast<T>();
    }
  }

  /// Optimized search for Reminder entities using Isar field queries
  Future<List<T>> _searchReminder<T>(IsarCollection<dynamic> collection, String lowerQuery) async {
    try {
      // Cast to proper type to get access to filter methods
      final reminderCollection = collection as IsarCollection<ReminderModel>;
      
      final results = await reminderCollection
          .filter()
          .messageContains(lowerQuery, caseSensitive: false)
          .or()
          .recurrencePatternContains(lowerQuery, caseSensitive: false)
          .findAll();
      
      return results.cast<T>();
    } catch (e) {
      developer.log('Failed to search Reminder entities: $e');
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
        case 'TodoModel':
          final todo = entity as TodoModel;
          // Save Subtasks links
          if (todo.subtasks.isNotEmpty) {
            await todo.subtasks.save();
          }
          // Save Reminders links
          if (todo.reminders.isNotEmpty) {
            await todo.reminders.save();
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
        case 'TodoModel':
          final todo = entity as TodoModel;
          // Load Subtasks links
          await todo.subtasks.load();
          // Load Reminders links
          await todo.reminders.load();
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
        case 'TodoModel':
          final todo = entity as TodoModel;
          // Clear Subtasks links
          todo.subtasks.clear();
          await todo.subtasks.save();
          // Clear Reminders links
          todo.reminders.clear();
          await todo.reminders.save();
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