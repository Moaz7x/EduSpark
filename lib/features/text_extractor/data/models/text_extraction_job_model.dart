import 'package:isar/isar.dart';
import '../../domain/entities/text_extraction_job_entity.dart';
import 'extracted_text_model.dart';
import 'media_source_model.dart';

part 'text_extraction_job_model.g.dart';

/// Data model for TextExtractionJob entity.
///
/// This model handles data persistence and serialization for TextExtractionJob,
/// providing conversion methods between domain entities and data models.
@Collection()
class TextExtractionJobModel {

  Id? id = Isar.autoIncrement;

  final int jobId;
  /// Relationship link to mediaSource entity
  final IsarLink<MediaSourceModel> mediaSource = IsarLink<MediaSourceModel>();
  @Index(type: IndexType.hash)
  final String jobType;
  @Index(type: IndexType.hash)
  final String jobStatus;
  @Index(type: IndexType.value)
  final String requestedAt;
  @Index(type: IndexType.value)
  final String completedAt;
  @Index(type: IndexType.value)
  final String errorMessage;
  @Backlink(to: 'textExtractionJob')
  final IsarLinks<ExtractedTextModel> extractedtexts = IsarLinks<ExtractedTextModel>();

  TextExtractionJobModel({
    this.id,
    required this.jobId,
    required this.jobType,
    required this.jobStatus,
    required this.requestedAt,
    required this.completedAt,
    required this.errorMessage,
  });

  /// Creates a model from an entity.
  factory TextExtractionJobModel.fromEntity(TextExtractionJobEntity entity) {
    return TextExtractionJobModel(
      id: entity.id,
      jobId: entity.jobId,
      jobType: entity.jobType,
      jobStatus: entity.jobStatus,
      requestedAt: entity.requestedAt,
      completedAt: entity.completedAt,
      errorMessage: entity.errorMessage,
    );
  }

  /// Converts this model to an entity.
  TextExtractionJobEntity toEntity() {
    return TextExtractionJobEntity(
      id: id,
      jobId: jobId,
      jobType: jobType,
      jobStatus: jobStatus,
      requestedAt: requestedAt,
      completedAt: completedAt,
      errorMessage: errorMessage,
      extractedtexts: null, // Relationships handled separately
    );
  }

}

