import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/types/either.dart';
import '../../../../core/types/failures.dart';
import '../../domain/entities/media_source_entity.dart';
import '../../domain/entities/text_extraction_job_entity.dart';
import '../../domain/entities/extracted_text_entity.dart';
import '../../domain/entities/user_settings_entity.dart';
import '../../domain/repositories/text_extraction_job_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/media_source_model.dart';
import '../models/text_extraction_job_model.dart';
import '../models/extracted_text_model.dart';
import '../models/user_settings_model.dart';


/// Repository implementation for TextExtractionJob feature.
///
/// This implementation provides concrete data access operations
/// by coordinating between the domain layer and data sources.
/// All methods return Either<Failure, T> for functional error handling.
class TextExtractionJobRepositoryImpl implements TextExtractionJobRepository {
  final LocalDataSource localDataSource;

  TextExtractionJobRepositoryImpl(this.localDataSource);

  static const String _entityType = 'text_extraction_job';

  @override
  Future<Either<Failure, TextExtractionJobEntity>> create(TextExtractionJobEntity entity) async {
    try {
      final model = TextExtractionJobModel.fromEntity(entity);
      final result = await localDataSource.create<TextExtractionJobModel>(model);
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
  Future<Either<Failure, TextExtractionJobEntity?>> getById(int id) async {
    try {
      final result = await localDataSource.getById<TextExtractionJobModel>(id, _entityType);
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
  Future<Either<Failure, List<TextExtractionJobEntity>>> getAll() async {
    try {
      final result = await localDataSource.getAll<TextExtractionJobModel>(_entityType);
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
  Future<Either<Failure, TextExtractionJobEntity>> update(TextExtractionJobEntity entity) async {
    try {
      final model = TextExtractionJobModel.fromEntity(entity);
      final result = await localDataSource.update<TextExtractionJobModel>(model);
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
  Future<Either<Failure, List<TextExtractionJobEntity>>> getByField(
      String fieldName, dynamic value) async {
    try {
      final filters = {fieldName: value};
      final result =
          await localDataSource.getFiltered<TextExtractionJobModel>(filters, _entityType);
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
  Future<Either<Failure, List<TextExtractionJobEntity>>> search(String query) async {
    try {
      final result =
          await localDataSource.search<TextExtractionJobModel>(query, _entityType);
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
  Future<Either<Failure, List<TextExtractionJobEntity>>> getPaginated(
      int page, int limit) async {
    try {
      final result = await localDataSource.getPaginated<TextExtractionJobModel>(
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
  Future<Either<Failure, List<TextExtractionJobEntity>>> getFiltered(
      Map<String, dynamic> filters) async {
    try {
      final result =
          await localDataSource.getFiltered<TextExtractionJobModel>(filters, _entityType);
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

  /// Gets all extractedtexts for a specific textextractionjob
  Future<List<ExtractedTextEntity>> getExtractedtexts(int textextractionjobId) async {
    try {
      final filters = {'textextractionjobId': textextractionjobId};
      final result = await localDataSource.getFiltered<ExtractedTextModel>(filters, 'extracted_text');
      return result.fold(
        (failure) => throw RepositoryException(failure.message, null),
        (models) => models.map((ExtractedTextModel model) => model.toEntity()).toList(),
      );
    } catch (e) {
      throw RepositoryException('Failed to get extractedtexts for TextExtractionJob', e);
    }
  }

  @override

  /// Loads the entity with all its relationships.
  Future<Either<Failure, TextExtractionJobEntity>> loadWithRelationships(
      TextExtractionJobEntity entity) async {
    try {
      final model = TextExtractionJobModel.fromEntity(entity);
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
  Future<Either<Failure, bool>> saveWithRelationships(TextExtractionJobEntity entity,
      {List<dynamic>? childEntities}) async {
    try {
      final model = TextExtractionJobModel.fromEntity(entity);
      List<dynamic>? childModels;
      if (childEntities != null) {
        childModels = childEntities.map((child) {
          // Convert child entities to models based on their type
          if (child is MediaSourceEntity) {
            return MediaSourceModel.fromEntity(child);
          }
          if (child is ExtractedTextEntity) {
            return ExtractedTextModel.fromEntity(child);
          }
          if (child is UserSettingsEntity) {
            return UserSettingsModel.fromEntity(child);
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

