import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/types/either.dart';
import '../../../../core/types/failures.dart';
import '../../domain/entities/deck_entity.dart';
import '../../domain/entities/flashcard_entity.dart';
import '../../domain/entities/media_entity.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/entities/tag_entity.dart';
import '../../domain/entities/flashcard_tag_entity.dart';
import '../../domain/repositories/media_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/deck_model.dart';
import '../models/flashcard_model.dart';
import '../models/media_model.dart';
import '../models/review_model.dart';
import '../models/tag_model.dart';
import '../models/flashcard_tag_model.dart';


/// Repository implementation for Media feature.
///
/// This implementation provides concrete data access operations
/// by coordinating between the domain layer and data sources.
/// All methods return Either<Failure, T> for functional error handling.
class MediaRepositoryImpl implements MediaRepository {
  final LocalDataSource localDataSource;

  MediaRepositoryImpl(this.localDataSource);

  static const String _entityType = 'media';

  @override
  Future<Either<Failure, MediaEntity>> create(MediaEntity entity) async {
    try {
      final model = MediaModel.fromEntity(entity);
      final result = await localDataSource.create<MediaModel>(model);
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
  Future<Either<Failure, MediaEntity?>> getById(int id) async {
    try {
      final result = await localDataSource.getById<MediaModel>(id, _entityType);
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
  Future<Either<Failure, List<MediaEntity>>> getAll() async {
    try {
      final result = await localDataSource.getAll<MediaModel>(_entityType);
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
  Future<Either<Failure, MediaEntity>> update(MediaEntity entity) async {
    try {
      final model = MediaModel.fromEntity(entity);
      final result = await localDataSource.update<MediaModel>(model);
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
  Future<Either<Failure, List<MediaEntity>>> getByField(
      String fieldName, dynamic value) async {
    try {
      final filters = {fieldName: value};
      final result =
          await localDataSource.getFiltered<MediaModel>(filters, _entityType);
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
  Future<Either<Failure, List<MediaEntity>>> search(String query) async {
    try {
      final result =
          await localDataSource.search<MediaModel>(query, _entityType);
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
  Future<Either<Failure, List<MediaEntity>>> getPaginated(
      int page, int limit) async {
    try {
      final result = await localDataSource.getPaginated<MediaModel>(
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
  Future<Either<Failure, List<MediaEntity>>> getFiltered(
      Map<String, dynamic> filters) async {
    try {
      final result =
          await localDataSource.getFiltered<MediaModel>(filters, _entityType);
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
  Future<Either<Failure, MediaEntity>> loadWithRelationships(
      MediaEntity entity) async {
    try {
      final model = MediaModel.fromEntity(entity);
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
  Future<Either<Failure, bool>> saveWithRelationships(MediaEntity entity,
      {List<dynamic>? childEntities}) async {
    try {
      final model = MediaModel.fromEntity(entity);
      List<dynamic>? childModels;
      if (childEntities != null) {
        childModels = childEntities.map((child) {
          // Convert child entities to models based on their type
          if (child is DeckEntity) {
            return DeckModel.fromEntity(child);
          }
          if (child is FlashcardEntity) {
            return FlashcardModel.fromEntity(child);
          }
          if (child is ReviewEntity) {
            return ReviewModel.fromEntity(child);
          }
          if (child is TagEntity) {
            return TagModel.fromEntity(child);
          }
          if (child is FlashcardTagEntity) {
            return FlashcardTagModel.fromEntity(child);
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

