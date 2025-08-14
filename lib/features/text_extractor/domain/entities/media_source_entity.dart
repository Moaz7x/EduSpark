import 'package:equatable/equatable.dart';
import 'text_extraction_job_entity.dart';

/// MediaSource entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for MediaSource,
/// remaining independent of external frameworks and data sources.
class MediaSourceEntity extends Equatable {
  final int? id;
  final int mediaSourceId;
  final String type;
  final String? url;
  final String fileName;
  final String fileSize;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<TextExtractionJobEntity>? textextractionjobs;

  const MediaSourceEntity({
    this.id,
    required this.mediaSourceId,
    required this.type,
    this.url,
    required this.fileName,
    required this.fileSize,
    required this.createdAt,
    this.updatedAt,
    this.textextractionjobs,
  });

  @override
  List<Object?> get props => [
    id,
    mediaSourceId,
    type,
    url,
    fileName,
    fileSize,
    createdAt,
    updatedAt,
    textextractionjobs,
  ];

  // Relationship methods

  /// Gets all textextractionjobs for this mediasource
  List<TextExtractionJobEntity> getTextextractionjobs() {
    return textextractionjobs ?? [];
  }

  /// Adds a text_extraction_job to this mediasource
  MediaSourceEntity addTextExtractionJobEntity(TextExtractionJobEntity text_extraction_job) {
    final updatedTextextractionjobs = List<TextExtractionJobEntity>.from(textextractionjobs ?? [])
      ..add(text_extraction_job);
    return copyWith(textextractionjobs: updatedTextextractionjobs);
  }

  /// Removes a text_extraction_job from this mediasource
  MediaSourceEntity removeTextExtractionJobEntity(int text_extraction_jobId) {
    final updatedTextextractionjobs = textextractionjobs?.where((item) => item.id != text_extraction_jobId).toList();
    return copyWith(textextractionjobs: updatedTextextractionjobs);
  }

  /// Creates a copy of this entity with updated values.
  MediaSourceEntity copyWith({
    int? mediaSourceId,
    String? type,
    String? url,
    String? fileName,
    String? fileSize,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<TextExtractionJobEntity>? textextractionjobs,
  }) {
    return MediaSourceEntity(
      mediaSourceId: mediaSourceId ?? this.mediaSourceId,
      type: type ?? this.type,
      url: url ?? this.url,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      textextractionjobs: textextractionjobs ?? this.textextractionjobs,
    );
  }
}

