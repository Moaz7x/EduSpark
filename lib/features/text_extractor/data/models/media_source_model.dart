import 'package:isar/isar.dart';
import '../../domain/entities/media_source_entity.dart';
import 'text_extraction_job_model.dart';

part 'media_source_model.g.dart';

/// Data model for MediaSource entity.
///
/// This model handles data persistence and serialization for MediaSource,
/// providing conversion methods between domain entities and data models.
@Collection()
class MediaSourceModel {

  Id? id = Isar.autoIncrement;

  final int mediaSourceId;
  @Index(type: IndexType.hash)
  final String type;
  @Index(type: IndexType.value)
  final String? url;
  @Index(type: IndexType.value)
  final String fileName;
  @Index(type: IndexType.value)
  final String fileSize;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;
  @Backlink(to: 'mediaSource')
  final IsarLinks<TextExtractionJobModel> textextractionjobs = IsarLinks<TextExtractionJobModel>();

  MediaSourceModel({
    this.id,
    required this.mediaSourceId,
    required this.type,
    this.url,
    required this.fileName,
    required this.fileSize,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory MediaSourceModel.fromEntity(MediaSourceEntity entity) {
    return MediaSourceModel(
      id: entity.id,
      mediaSourceId: entity.mediaSourceId,
      type: entity.type,
      url: entity.url,
      fileName: entity.fileName,
      fileSize: entity.fileSize,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  MediaSourceEntity toEntity() {
    return MediaSourceEntity(
      id: id,
      mediaSourceId: mediaSourceId,
      type: type,
      url: url,
      fileName: fileName,
      fileSize: fileSize,
      createdAt: createdAt,
      updatedAt: updatedAt,
      textextractionjobs: null, // Relationships handled separately
    );
  }

}

