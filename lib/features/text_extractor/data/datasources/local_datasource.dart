
import '../../../../core/types/types.dart';



/// Local data source interface for TextExtractor feature.
///
/// This interface defines the contract for local data persistence operations
/// with support for multiple entity types and comprehensive CRUD operations.
/// All methods return Future<Either<Failure, T>> for functional error handling.
abstract class LocalDataSource {
  /// Creates a new entity in local storage.
  ///
  /// [model] The entity model to create
  /// Returns Either<Failure, T> - Right with created entity (including generated fields) or Left with failure
  Future<Either<Failure, T>> create<T>(T model);

  /// Retrieves an entity by its ID and type.
  ///
  /// [id] The unique identifier of the entity
  /// [entityType] The type of entity to retrieve (e.g., 'note', 'user')
  /// Returns Either<Failure, T?> - Right with entity if found (null if not found) or Left with failure
  Future<Either<Failure, T?>> getById<T>(int id, String entityType);

  /// Retrieves all entities of a specific type.
  ///
  /// [entityType] The type of entities to retrieve
  /// Returns Either<Failure, List<T>> - Right with list of entities (empty if none found) or Left with failure
  Future<Either<Failure, List<T>>> getAll<T>(String entityType);

  /// Updates an existing entity in local storage.
  ///
  /// [model] The entity model with updated data
  /// Returns Either<Failure, T> - Right with updated entity or Left with failure
  Future<Either<Failure, T>> update<T>(T model);

  /// Deletes an entity by its ID and type.
  ///
  /// [id] The unique identifier of the entity to delete
  /// [entityType] The type of entity to delete
  /// Returns Either<Failure, bool> - Right with true if deleted, false if not found, or Left with failure
  Future<Either<Failure, bool>> delete(int id, String entityType);

  /// Searches entities of a specific type using a text query.
  ///
  /// [query] The search query string
  /// [entityType] The type of entities to search
  /// Returns Either<Failure, List<T>> - Right with matching entities (empty if none found) or Left with failure
  Future<Either<Failure, List<T>>> search<T>(String query, String entityType);

  /// Retrieves entities with pagination support.
  ///
  /// [page] The page number (0-based)
  /// [limit] The maximum number of entities per page
  /// [entityType] The type of entities to retrieve
  /// Returns Either<Failure, List<T>> - Right with paginated entities or Left with failure
  Future<Either<Failure, List<T>>> getPaginated<T>(int page, int limit, String entityType);

  /// Retrieves entities filtered by multiple criteria.
  ///
  /// [filters] A map of field names to values for filtering
  /// [entityType] The type of entities to filter
  /// Returns Either<Failure, List<T>> - Right with filtered entities or Left with failure
  Future<Either<Failure, List<T>>> getFiltered<T>(
      Map<String, dynamic> filters, String entityType);

  /// Counts the total number of entities of a specific type.
  ///
  /// [entityType] The type of entities to count
  /// Returns Either<Failure, int> - Right with total count or Left with failure
  Future<Either<Failure, int>> count(String entityType);

  /// Checks if an entity exists by its ID and type.
  ///
  /// [id] The unique identifier of the entity
  /// [entityType] The type of entity to check
  /// Returns Either<Failure, bool> - Right with true if exists, false otherwise, or Left with failure
  Future<Either<Failure, bool>> exists(int id, String entityType);

  /// Deletes all entities of a specific type.
  ///
  /// [entityType] The type of entities to delete
  /// Returns Either<Failure, int> - Right with number of entities deleted or Left with failure
  Future<Either<Failure, int>> deleteAll(String entityType);

  /// Initializes the data source.
  ///
  /// This method should be called before using any other methods.
  /// Returns Either<Failure, void> - Right with void if successful or Left with failure
  Future<Either<Failure, void>> initialize();

  /// Closes the data source and releases resources.
  ///
  /// This method should be called when the data source is no longer needed.
  /// Returns Either<Failure, void> - Right with void if successful or Left with failure
  Future<Either<Failure, void>> close();

  // ============================================================================
  // RELATIONSHIP MANAGEMENT METHODS
  // ============================================================================

  /// Loads all relationships for a given entity with proper cascade loading.
  ///
  /// [entity] The entity to load relationships for
  /// [entityType] The type of the entity
  /// Returns Either<Failure, T> - Right with entity and loaded relationships or Left with failure
  Future<Either<Failure, T>> loadWithRelationships<T>(T entity, String entityType);

  /// Saves entity with all its relationships in a single transaction.
  ///
  /// [entity] The main entity to save
  /// [entityType] The type of the main entity
  /// [childEntities] Optional list of child entities to save with the main entity
  /// Returns Either<Failure, bool> - Right with true if all saved successfully or Left with failure
  Future<Either<Failure, bool>> saveWithRelationships<T>(T entity, String entityType, {List<dynamic>? childEntities});

  /// Deletes entity with cascade delete for all related child entities.
  ///
  /// [id] The ID of the entity to delete
  /// [entityType] The type of the entity to delete
  /// Returns Either<Failure, bool> - Right with true if all deleted successfully or Left with failure
  Future<Either<Failure, bool>> deleteWithCascade(int id, String entityType);

  /// Clears all data for an entity type and its related entities.
  ///
  /// [entityType] The type of entity to clear (will also clear related entities)
  /// Returns Either<Failure, bool> - Right with true if all cleared successfully or Left with failure
  Future<Either<Failure, bool>> clearWithRelationships(String entityType);

  /// Gets all child entities for a given parent entity.
  ///
  /// [parentId] The ID of the parent entity
  /// [parentType] The type of the parent entity
  /// [childType] The type of child entities to retrieve
  /// Returns Either<Failure, List<T>> - Right with list of child entities or Left with failure
  Future<Either<Failure, List<T>>> getChildEntities<T>(int parentId, String parentType, String childType);
}
