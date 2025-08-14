import 'package:equatable/equatable.dart';
import 'extracted_text_entity.dart';

/// TextExtractionJob entity representing the core business object.
///
/// This entity encapsulates the business logic and rules for TextExtractionJob,
/// remaining independent of external frameworks and data sources.
class TextExtractionJobEntity extends Equatable {
  final int? id;
  final int jobId;
  final String jobType;
  final String jobStatus;
  final String requestedAt;
  final String completedAt;
  final String errorMessage;
  final List<ExtractedTextEntity>? extractedtexts;

  const TextExtractionJobEntity({
    this.id,
    required this.jobId,
    required this.jobType,
    required this.jobStatus,
    required this.requestedAt,
    required this.completedAt,
    required this.errorMessage,
    this.extractedtexts,
  });

  @override
  List<Object?> get props => [
    id,
    jobId,
    jobType,
    jobStatus,
    requestedAt,
    completedAt,
    errorMessage,
    extractedtexts,
  ];

  // Relationship methods

  /// Gets all extractedtexts for this textextractionjob
  List<ExtractedTextEntity> getExtractedtexts() {
    return extractedtexts ?? [];
  }

  /// Adds a extracted_text to this textextractionjob
  TextExtractionJobEntity addExtractedTextEntity(ExtractedTextEntity extracted_text) {
    final updatedExtractedtexts = List<ExtractedTextEntity>.from(extractedtexts ?? [])
      ..add(extracted_text);
    return copyWith(extractedtexts: updatedExtractedtexts);
  }

  /// Removes a extracted_text from this textextractionjob
  TextExtractionJobEntity removeExtractedTextEntity(int extracted_textId) {
    final updatedExtractedtexts = extractedtexts?.where((item) => item.id != extracted_textId).toList();
    return copyWith(extractedtexts: updatedExtractedtexts);
  }

  /// Creates a copy of this entity with updated values.
  TextExtractionJobEntity copyWith({
    int? jobId,
    String? jobType,
    String? jobStatus,
    String? requestedAt,
    String? completedAt,
    String? errorMessage,
    List<ExtractedTextEntity>? extractedtexts,
  }) {
    return TextExtractionJobEntity(
      jobId: jobId ?? this.jobId,
      jobType: jobType ?? this.jobType,
      jobStatus: jobStatus ?? this.jobStatus,
      requestedAt: requestedAt ?? this.requestedAt,
      completedAt: completedAt ?? this.completedAt,
      errorMessage: errorMessage ?? this.errorMessage,
      extractedtexts: extractedtexts ?? this.extractedtexts,
    );
  }
}

