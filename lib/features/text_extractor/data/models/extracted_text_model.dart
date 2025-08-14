import 'package:isar/isar.dart';
import '../../domain/entities/extracted_text_entity.dart';
import 'text_extraction_job_model.dart';

part 'extracted_text_model.g.dart';

/// Data model for ExtractedText entity.
///
/// This model handles data persistence and serialization for ExtractedText,
/// providing conversion methods between domain entities and data models.
@Collection()
class ExtractedTextModel {

  Id? id = Isar.autoIncrement;

  final int textId;
  /// Relationship link to textExtractionJob entity
  final IsarLink<TextExtractionJobModel> textExtractionJob = IsarLink<TextExtractionJobModel>();
  @Index(type: IndexType.value)
  final String textContent;
  @Index(type: IndexType.value)
  final String language;
  @Index(type: IndexType.value)
  final bool? isReviewed;
  @Index(type: IndexType.value)
  final bool? isApproved;
  @Index(type: IndexType.value)
  final DateTime createdAt;
  @Index(type: IndexType.value)
  final DateTime? updatedAt;

  ExtractedTextModel({
    this.id,
    required this.textId,
    required this.textContent,
    required this.language,
    this.isReviewed,
    this.isApproved,
    required this.createdAt,
    this.updatedAt,
  });

  /// Creates a model from an entity.
  factory ExtractedTextModel.fromEntity(ExtractedTextEntity entity) {
    return ExtractedTextModel(
      id: entity.id,
      textId: entity.textId,
      textContent: entity.textContent,
      language: entity.language,
      isReviewed: entity.isReviewed,
      isApproved: entity.isApproved,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts this model to an entity.
  ExtractedTextEntity toEntity() {
    return ExtractedTextEntity(
      id: id,
      textId: textId,
      textContent: textContent,
      language: language,
      isReviewed: isReviewed,
      isApproved: isApproved,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

}

