import '../entities/subtask_entity.dart';
import '../../../../core/types/either.dart';
import '../../../../core/types/failures.dart';

/// Repository interface for Subtask entities following Clean Architecture principles.
///
/// This interface defines the contract for data operations without implementation details.
/// The data layer will provide concrete implementations of this interface.
///
/// All methods return Future<Either<Failure, T>> for functional error handling.
/// Left side contains Failure objects, Right side contains successful results.
abstract class SubtaskRepository {

  // ==================== CRUD Operations ====================

  /// Creates a new Subtask entity in the data source.
  ///
  /// [entity] The Subtask entity to create
  /// Returns Either<Failure, Entity> - Right with created entity (including generated ID) or Left with failure
  Future<Either<Failure, SubtaskEntity>> create(SubtaskEntity entity);

  /// Retrieves a Subtask entity by its unique identifier.
  ///
  /// [id] The unique identifier of the entity
  /// Returns Either<Failure, Entity?> - Right with entity if found (null if not found) or Left with failure
  Future<Either<Failure, SubtaskEntity?>> getById(int id);

  /// Retrieves all Subtask entities from the data source.
  ///
  /// Returns Either<Failure, List<Entity>> - Right with list of entities (empty if none found) or Left with failure
  Future<Either<Failure, List<SubtaskEntity>>> getAll();

  /// Updates an existing Subtask entity in the data source.
  ///
  /// [entity] The Subtask entity with updated data
  /// Returns Either<Failure, Entity> - Right with updated entity or Left with failure
  Future<Either<Failure, SubtaskEntity>> update(SubtaskEntity entity);

  /// Deletes a Subtask entity by its unique identifier.
  ///
  /// [id] The unique identifier of the entity to delete
  /// Returns Either<Failure, bool> - Right with true if deleted, false if not found, or Left with failure
  Future<Either<Failure, bool>> delete(int id);

  // ==================== Filter Operations ====================

  /// Retrieves entities filtered by a specific field value.
  ///
  /// [fieldName] The name of the field to filter by
  /// [value] The value to match against
  /// Returns Either<Failure, List<Entity>> - Right with matching entities (empty if none found) or Left with failure
  Future<Either<Failure, List<SubtaskEntity>>> getByField(String fieldName, dynamic value);

  /// Searches entities using a text query across searchable fields.
  ///
  /// [query] The search query string
  /// Returns Either<Failure, List<Entity>> - Right with matching entities (empty if none found) or Left with failure
  Future<Either<Failure, List<SubtaskEntity>>> search(String query);

  /// Retrieves entities with pagination support.
  ///
  /// [page] The page number (0-based)
  /// [limit] The maximum number of entities per page
  /// Returns Either<Failure, List<Entity>> - Right with paginated entities or Left with failure
  Future<Either<Failure, List<SubtaskEntity>>> getPaginated(int page, int limit);

  /// Retrieves entities filtered by multiple criteria.
  ///
  /// [filters] A map of field names to values for filtering
  /// Returns Either<Failure, List<Entity>> - Right with filtered entities or Left with failure
  Future<Either<Failure, List<SubtaskEntity>>> getFiltered(Map<String, dynamic> filters);

  // ==================== Utility Operations ====================

  /// Counts the total number of entities in the data source.
  ///
  /// Returns Either<Failure, int> - Right with total count or Left with failure
  Future<Either<Failure, int>> count();

  /// Checks if an entity with the given ID exists.
  ///
  /// [id] The unique identifier to check
  /// Returns Either<Failure, bool> - Right with true if exists, false otherwise, or Left with failure
  Future<Either<Failure, bool>> exists(int id);

  /// Deletes all entities from the data source.
  ///
  /// Returns Either<Failure, int> - Right with number of entities deleted or Left with failure
  Future<Either<Failure, int>> deleteAll();

  // ============================================================================
  // RELATIONSHIP MANAGEMENT METHODS
  // ============================================================================

  /// Loads the entity with all its relationships.
  ///
  /// [entity] The entity to load relationships for
  /// Returns Either<Failure, Entity> - Right with entity and loaded relationships or Left with failure
  Future<Either<Failure, SubtaskEntity>> loadWithRelationships(SubtaskEntity entity);

  /// Saves the entity with all its relationships in a single transaction.
  ///
  /// [entity] The main entity to save
  /// [childEntities] Optional list of child entities to save with the main entity
  /// Returns Either<Failure, bool> - Right with true if all saved successfully or Left with failure
  Future<Either<Failure, bool>> saveWithRelationships(SubtaskEntity entity, {List<dynamic>? childEntities});

  /// Clears all data for this entity type and its related entities.
  ///
  /// Returns Either<Failure, bool> - Right with true if all cleared successfully or Left with failure
  Future<Either<Failure, bool>> clearWithRelationships();

  /// Gets all child entities for a given parent entity.
  ///
  /// [parentId] The ID of the parent entity
  /// [childType] The type of child entities to retrieve
  /// Returns Either<Failure, List<T>> - Right with list of child entities or Left with failure
  Future<Either<Failure, List<T>>> getChildEntities<T>(int parentId, String childType);
}

