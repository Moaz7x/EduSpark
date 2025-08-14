import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local_datasource.dart';
import '../datasources/local_datasource_impl.dart';
import '../repositories/repositories.dart';

import '../../domain/usecases/media_source/create_media_source.dart';
import '../../domain/usecases/media_source/get_by_id_media_source.dart';
import '../../domain/usecases/media_source/get_all_media_source.dart';
import '../../domain/usecases/media_source/update_media_source.dart';
import '../../domain/usecases/media_source/delete_media_source.dart';
import '../../domain/usecases/media_source/search_media_source.dart';
import '../../domain/usecases/media_source/get_paginated_media_source.dart';
import '../../domain/usecases/media_source/get_filtered_media_source.dart';
import '../../domain/usecases/media_source/count_media_source.dart';

import '../../domain/usecases/text_extraction_job/create_text_extraction_job.dart';
import '../../domain/usecases/text_extraction_job/get_by_id_text_extraction_job.dart';
import '../../domain/usecases/text_extraction_job/get_all_text_extraction_job.dart';
import '../../domain/usecases/text_extraction_job/update_text_extraction_job.dart';
import '../../domain/usecases/text_extraction_job/delete_text_extraction_job.dart';
import '../../domain/usecases/text_extraction_job/search_text_extraction_job.dart';
import '../../domain/usecases/text_extraction_job/get_paginated_text_extraction_job.dart';
import '../../domain/usecases/text_extraction_job/get_filtered_text_extraction_job.dart';
import '../../domain/usecases/text_extraction_job/count_text_extraction_job.dart';

import '../../domain/usecases/extracted_text/create_extracted_text.dart';
import '../../domain/usecases/extracted_text/get_by_id_extracted_text.dart';
import '../../domain/usecases/extracted_text/get_all_extracted_text.dart';
import '../../domain/usecases/extracted_text/update_extracted_text.dart';
import '../../domain/usecases/extracted_text/delete_extracted_text.dart';
import '../../domain/usecases/extracted_text/search_extracted_text.dart';
import '../../domain/usecases/extracted_text/get_paginated_extracted_text.dart';
import '../../domain/usecases/extracted_text/get_filtered_extracted_text.dart';
import '../../domain/usecases/extracted_text/count_extracted_text.dart';

import '../../domain/usecases/user_settings/create_user_settings.dart';
import '../../domain/usecases/user_settings/get_by_id_user_settings.dart';
import '../../domain/usecases/user_settings/get_all_user_settings.dart';
import '../../domain/usecases/user_settings/update_user_settings.dart';
import '../../domain/usecases/user_settings/delete_user_settings.dart';
import '../../domain/usecases/user_settings/search_user_settings.dart';
import '../../domain/usecases/user_settings/get_paginated_user_settings.dart';
import '../../domain/usecases/user_settings/get_filtered_user_settings.dart';
import '../../domain/usecases/user_settings/count_user_settings.dart';


/// Riverpod providers for TextExtractor feature data layer.
///
/// This file contains all the providers needed for dependency injection
/// in the data layer, supporting multiple entities and clean architecture.

// ==================== Core Data Source Providers ====================

/// Provider for the local data source implementation.
///
/// This provider creates and initializes the LocalDataSource instance
/// that will be used throughout the application for local data persistence.
final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  final dataSource = LocalDataSourceImpl();

  // Initialize the data source when first accessed
  ref.onDispose(() {
    dataSource.close();
  });

  return dataSource;
});

/// Provider for initializing the local data source.
///
/// This provider ensures the data source is properly initialized
/// before being used by other providers.
final localDataSourceInitProvider = FutureProvider<void>((ref) async {
  final dataSource = ref.read(localDataSourceProvider);
  await dataSource.initialize();
});


// ==================== MediaSource Repository Providers ====================

/// Provider for MediaSource repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final mediaSourceRepositoryProvider = Provider<MediaSourceRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return MediaSourceRepositoryImpl(localDataSource);
});

// ==================== MediaSource Use Case Providers ====================

/// Provider for CreateMediaSourceUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createMediaSourceUseCaseProvider = Provider<CreateMediaSourceUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return CreateMediaSourceUseCase(repository);
});

/// Provider for GetMediaSourceByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getMediaSourceByIdUseCaseProvider = Provider<GetMediaSourceByIdUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return GetMediaSourceByIdUseCase(repository);
});

/// Provider for GetAllMediaSourcesUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllMediaSourcesUseCaseProvider = Provider<GetAllMediaSourcesUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return GetAllMediaSourcesUseCase(repository);
});

/// Provider for UpdateMediaSourceUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateMediaSourceUseCaseProvider = Provider<UpdateMediaSourceUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return UpdateMediaSourceUseCase(repository);
});

/// Provider for DeleteMediaSourceUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteMediaSourceUseCaseProvider = Provider<DeleteMediaSourceUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return DeleteMediaSourceUseCase(repository);
});

/// Provider for SearchMediaSourcesUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchMediaSourcesUseCaseProvider = Provider<SearchMediaSourcesUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return SearchMediaSourcesUseCase(repository);
});

/// Provider for GetPaginatedMediaSourcesUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedMediaSourcesUseCaseProvider = Provider<GetPaginatedMediaSourcesUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return GetPaginatedMediaSourcesUseCase(repository);
});

/// Provider for GetFilteredMediaSourcesUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredMediaSourcesUseCaseProvider = Provider<GetFilteredMediaSourcesUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return GetFilteredMediaSourcesUseCase(repository);
});

/// Provider for CountMediaSourcesUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countMediaSourcesUseCaseProvider = Provider<CountMediaSourcesUseCase>((ref) {
  final repository = ref.read(mediaSourceRepositoryProvider);
  return CountMediaSourcesUseCase(repository);
});


// ==================== TextExtractionJob Repository Providers ====================

/// Provider for TextExtractionJob repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final textExtractionJobRepositoryProvider = Provider<TextExtractionJobRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return TextExtractionJobRepositoryImpl(localDataSource);
});

// ==================== TextExtractionJob Use Case Providers ====================

/// Provider for CreateTextExtractionJobUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createTextExtractionJobUseCaseProvider = Provider<CreateTextExtractionJobUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return CreateTextExtractionJobUseCase(repository);
});

/// Provider for GetTextExtractionJobByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getTextExtractionJobByIdUseCaseProvider = Provider<GetTextExtractionJobByIdUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return GetTextExtractionJobByIdUseCase(repository);
});

/// Provider for GetAllTextExtractionJobsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllTextExtractionJobsUseCaseProvider = Provider<GetAllTextExtractionJobsUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return GetAllTextExtractionJobsUseCase(repository);
});

/// Provider for UpdateTextExtractionJobUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateTextExtractionJobUseCaseProvider = Provider<UpdateTextExtractionJobUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return UpdateTextExtractionJobUseCase(repository);
});

/// Provider for DeleteTextExtractionJobUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteTextExtractionJobUseCaseProvider = Provider<DeleteTextExtractionJobUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return DeleteTextExtractionJobUseCase(repository);
});

/// Provider for SearchTextExtractionJobsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchTextExtractionJobsUseCaseProvider = Provider<SearchTextExtractionJobsUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return SearchTextExtractionJobsUseCase(repository);
});

/// Provider for GetPaginatedTextExtractionJobsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedTextExtractionJobsUseCaseProvider = Provider<GetPaginatedTextExtractionJobsUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return GetPaginatedTextExtractionJobsUseCase(repository);
});

/// Provider for GetFilteredTextExtractionJobsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredTextExtractionJobsUseCaseProvider = Provider<GetFilteredTextExtractionJobsUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return GetFilteredTextExtractionJobsUseCase(repository);
});

/// Provider for CountTextExtractionJobsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countTextExtractionJobsUseCaseProvider = Provider<CountTextExtractionJobsUseCase>((ref) {
  final repository = ref.read(textExtractionJobRepositoryProvider);
  return CountTextExtractionJobsUseCase(repository);
});


// ==================== ExtractedText Repository Providers ====================

/// Provider for ExtractedText repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final extractedTextRepositoryProvider = Provider<ExtractedTextRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return ExtractedTextRepositoryImpl(localDataSource);
});

// ==================== ExtractedText Use Case Providers ====================

/// Provider for CreateExtractedTextUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createExtractedTextUseCaseProvider = Provider<CreateExtractedTextUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return CreateExtractedTextUseCase(repository);
});

/// Provider for GetExtractedTextByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getExtractedTextByIdUseCaseProvider = Provider<GetExtractedTextByIdUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return GetExtractedTextByIdUseCase(repository);
});

/// Provider for GetAllExtractedTextsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllExtractedTextsUseCaseProvider = Provider<GetAllExtractedTextsUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return GetAllExtractedTextsUseCase(repository);
});

/// Provider for UpdateExtractedTextUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateExtractedTextUseCaseProvider = Provider<UpdateExtractedTextUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return UpdateExtractedTextUseCase(repository);
});

/// Provider for DeleteExtractedTextUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteExtractedTextUseCaseProvider = Provider<DeleteExtractedTextUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return DeleteExtractedTextUseCase(repository);
});

/// Provider for SearchExtractedTextsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchExtractedTextsUseCaseProvider = Provider<SearchExtractedTextsUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return SearchExtractedTextsUseCase(repository);
});

/// Provider for GetPaginatedExtractedTextsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedExtractedTextsUseCaseProvider = Provider<GetPaginatedExtractedTextsUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return GetPaginatedExtractedTextsUseCase(repository);
});

/// Provider for GetFilteredExtractedTextsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredExtractedTextsUseCaseProvider = Provider<GetFilteredExtractedTextsUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return GetFilteredExtractedTextsUseCase(repository);
});

/// Provider for CountExtractedTextsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countExtractedTextsUseCaseProvider = Provider<CountExtractedTextsUseCase>((ref) {
  final repository = ref.read(extractedTextRepositoryProvider);
  return CountExtractedTextsUseCase(repository);
});


// ==================== UserSettings Repository Providers ====================

/// Provider for UserSettings repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final userSettingsRepositoryProvider = Provider<UserSettingsRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return UserSettingsRepositoryImpl(localDataSource);
});

// ==================== UserSettings Use Case Providers ====================

/// Provider for CreateUserSettingsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createUserSettingsUseCaseProvider = Provider<CreateUserSettingsUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return CreateUserSettingsUseCase(repository);
});

/// Provider for GetUserSettingsByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getUserSettingsByIdUseCaseProvider = Provider<GetUserSettingsByIdUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return GetUserSettingsByIdUseCase(repository);
});

/// Provider for GetAllUserSettingssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllUserSettingssUseCaseProvider = Provider<GetAllUserSettingssUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return GetAllUserSettingssUseCase(repository);
});

/// Provider for UpdateUserSettingsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateUserSettingsUseCaseProvider = Provider<UpdateUserSettingsUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return UpdateUserSettingsUseCase(repository);
});

/// Provider for DeleteUserSettingsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteUserSettingsUseCaseProvider = Provider<DeleteUserSettingsUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return DeleteUserSettingsUseCase(repository);
});

/// Provider for SearchUserSettingssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchUserSettingssUseCaseProvider = Provider<SearchUserSettingssUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return SearchUserSettingssUseCase(repository);
});

/// Provider for GetPaginatedUserSettingssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedUserSettingssUseCaseProvider = Provider<GetPaginatedUserSettingssUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return GetPaginatedUserSettingssUseCase(repository);
});

/// Provider for GetFilteredUserSettingssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredUserSettingssUseCaseProvider = Provider<GetFilteredUserSettingssUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return GetFilteredUserSettingssUseCase(repository);
});

/// Provider for CountUserSettingssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countUserSettingssUseCaseProvider = Provider<CountUserSettingssUseCase>((ref) {
  final repository = ref.read(userSettingsRepositoryProvider);
  return CountUserSettingssUseCase(repository);
});



// ==================== Utility Providers ====================

/// Provider for checking if the data source is initialized.
///
/// This provider can be used to ensure the data source is ready
/// before performing operations.
final isDataSourceInitializedProvider = FutureProvider<bool>((ref) async {
  try {
    await ref.read(localDataSourceInitProvider.future);
    return true;
  } catch (e) {
    return false;
  }
});

/// Provider for getting all available entity types.
///
/// This provider returns a list of all entity types supported
/// by the current feature.
final availableEntityTypesProvider = Provider<List<String>>((ref) {
  return [

    'media_source',

    'text_extraction_job',

    'extracted_text',

    'user_settings',

  ];
});
