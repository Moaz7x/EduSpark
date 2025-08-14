import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local_datasource.dart';
import '../datasources/local_datasource_impl.dart';
import '../repositories/repositories.dart';

import '../../domain/usecases/deck/create_deck.dart';
import '../../domain/usecases/deck/get_by_id_deck.dart';
import '../../domain/usecases/deck/get_all_deck.dart';
import '../../domain/usecases/deck/update_deck.dart';
import '../../domain/usecases/deck/delete_deck.dart';
import '../../domain/usecases/deck/search_deck.dart';
import '../../domain/usecases/deck/get_paginated_deck.dart';
import '../../domain/usecases/deck/get_filtered_deck.dart';
import '../../domain/usecases/deck/count_deck.dart';

import '../../domain/usecases/flashcard/create_flashcard.dart';
import '../../domain/usecases/flashcard/get_by_id_flashcard.dart';
import '../../domain/usecases/flashcard/get_all_flashcard.dart';
import '../../domain/usecases/flashcard/update_flashcard.dart';
import '../../domain/usecases/flashcard/delete_flashcard.dart';
import '../../domain/usecases/flashcard/search_flashcard.dart';
import '../../domain/usecases/flashcard/get_paginated_flashcard.dart';
import '../../domain/usecases/flashcard/get_filtered_flashcard.dart';
import '../../domain/usecases/flashcard/count_flashcard.dart';

import '../../domain/usecases/media/create_media.dart';
import '../../domain/usecases/media/get_by_id_media.dart';
import '../../domain/usecases/media/get_all_media.dart';
import '../../domain/usecases/media/update_media.dart';
import '../../domain/usecases/media/delete_media.dart';
import '../../domain/usecases/media/search_media.dart';
import '../../domain/usecases/media/get_paginated_media.dart';
import '../../domain/usecases/media/get_filtered_media.dart';
import '../../domain/usecases/media/count_media.dart';

import '../../domain/usecases/review/create_review.dart';
import '../../domain/usecases/review/get_by_id_review.dart';
import '../../domain/usecases/review/get_all_review.dart';
import '../../domain/usecases/review/update_review.dart';
import '../../domain/usecases/review/delete_review.dart';
import '../../domain/usecases/review/search_review.dart';
import '../../domain/usecases/review/get_paginated_review.dart';
import '../../domain/usecases/review/get_filtered_review.dart';
import '../../domain/usecases/review/count_review.dart';

import '../../domain/usecases/tag/create_tag.dart';
import '../../domain/usecases/tag/get_by_id_tag.dart';
import '../../domain/usecases/tag/get_all_tag.dart';
import '../../domain/usecases/tag/update_tag.dart';
import '../../domain/usecases/tag/delete_tag.dart';
import '../../domain/usecases/tag/search_tag.dart';
import '../../domain/usecases/tag/get_paginated_tag.dart';
import '../../domain/usecases/tag/get_filtered_tag.dart';
import '../../domain/usecases/tag/count_tag.dart';

import '../../domain/usecases/flashcard_tag/create_flashcard_tag.dart';
import '../../domain/usecases/flashcard_tag/get_by_id_flashcard_tag.dart';
import '../../domain/usecases/flashcard_tag/get_all_flashcard_tag.dart';
import '../../domain/usecases/flashcard_tag/update_flashcard_tag.dart';
import '../../domain/usecases/flashcard_tag/delete_flashcard_tag.dart';
import '../../domain/usecases/flashcard_tag/search_flashcard_tag.dart';
import '../../domain/usecases/flashcard_tag/get_paginated_flashcard_tag.dart';
import '../../domain/usecases/flashcard_tag/get_filtered_flashcard_tag.dart';
import '../../domain/usecases/flashcard_tag/count_flashcard_tag.dart';


/// Riverpod providers for AdvancedFlashcards feature data layer.
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


// ==================== Deck Repository Providers ====================

/// Provider for Deck repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final deckRepositoryProvider = Provider<DeckRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return DeckRepositoryImpl(localDataSource);
});

// ==================== Deck Use Case Providers ====================

/// Provider for CreateDeckUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createDeckUseCaseProvider = Provider<CreateDeckUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return CreateDeckUseCase(repository);
});

/// Provider for GetDeckByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getDeckByIdUseCaseProvider = Provider<GetDeckByIdUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return GetDeckByIdUseCase(repository);
});

/// Provider for GetAllDecksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllDecksUseCaseProvider = Provider<GetAllDecksUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return GetAllDecksUseCase(repository);
});

/// Provider for UpdateDeckUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateDeckUseCaseProvider = Provider<UpdateDeckUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return UpdateDeckUseCase(repository);
});

/// Provider for DeleteDeckUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteDeckUseCaseProvider = Provider<DeleteDeckUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return DeleteDeckUseCase(repository);
});

/// Provider for SearchDecksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchDecksUseCaseProvider = Provider<SearchDecksUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return SearchDecksUseCase(repository);
});

/// Provider for GetPaginatedDecksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedDecksUseCaseProvider = Provider<GetPaginatedDecksUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return GetPaginatedDecksUseCase(repository);
});

/// Provider for GetFilteredDecksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredDecksUseCaseProvider = Provider<GetFilteredDecksUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return GetFilteredDecksUseCase(repository);
});

/// Provider for CountDecksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countDecksUseCaseProvider = Provider<CountDecksUseCase>((ref) {
  final repository = ref.read(deckRepositoryProvider);
  return CountDecksUseCase(repository);
});


// ==================== Flashcard Repository Providers ====================

/// Provider for Flashcard repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final flashcardRepositoryProvider = Provider<FlashcardRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return FlashcardRepositoryImpl(localDataSource);
});

// ==================== Flashcard Use Case Providers ====================

/// Provider for CreateFlashcardUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createFlashcardUseCaseProvider = Provider<CreateFlashcardUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return CreateFlashcardUseCase(repository);
});

/// Provider for GetFlashcardByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFlashcardByIdUseCaseProvider = Provider<GetFlashcardByIdUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return GetFlashcardByIdUseCase(repository);
});

/// Provider for GetAllFlashcardsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllFlashcardsUseCaseProvider = Provider<GetAllFlashcardsUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return GetAllFlashcardsUseCase(repository);
});

/// Provider for UpdateFlashcardUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateFlashcardUseCaseProvider = Provider<UpdateFlashcardUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return UpdateFlashcardUseCase(repository);
});

/// Provider for DeleteFlashcardUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteFlashcardUseCaseProvider = Provider<DeleteFlashcardUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return DeleteFlashcardUseCase(repository);
});

/// Provider for SearchFlashcardsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchFlashcardsUseCaseProvider = Provider<SearchFlashcardsUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return SearchFlashcardsUseCase(repository);
});

/// Provider for GetPaginatedFlashcardsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedFlashcardsUseCaseProvider = Provider<GetPaginatedFlashcardsUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return GetPaginatedFlashcardsUseCase(repository);
});

/// Provider for GetFilteredFlashcardsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredFlashcardsUseCaseProvider = Provider<GetFilteredFlashcardsUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return GetFilteredFlashcardsUseCase(repository);
});

/// Provider for CountFlashcardsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countFlashcardsUseCaseProvider = Provider<CountFlashcardsUseCase>((ref) {
  final repository = ref.read(flashcardRepositoryProvider);
  return CountFlashcardsUseCase(repository);
});


// ==================== Media Repository Providers ====================

/// Provider for Media repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final mediaRepositoryProvider = Provider<MediaRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return MediaRepositoryImpl(localDataSource);
});

// ==================== Media Use Case Providers ====================

/// Provider for CreateMediaUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createMediaUseCaseProvider = Provider<CreateMediaUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return CreateMediaUseCase(repository);
});

/// Provider for GetMediaByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getMediaByIdUseCaseProvider = Provider<GetMediaByIdUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return GetMediaByIdUseCase(repository);
});

/// Provider for GetAllMediasUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllMediasUseCaseProvider = Provider<GetAllMediasUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return GetAllMediasUseCase(repository);
});

/// Provider for UpdateMediaUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateMediaUseCaseProvider = Provider<UpdateMediaUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return UpdateMediaUseCase(repository);
});

/// Provider for DeleteMediaUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteMediaUseCaseProvider = Provider<DeleteMediaUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return DeleteMediaUseCase(repository);
});

/// Provider for SearchMediasUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchMediasUseCaseProvider = Provider<SearchMediasUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return SearchMediasUseCase(repository);
});

/// Provider for GetPaginatedMediasUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedMediasUseCaseProvider = Provider<GetPaginatedMediasUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return GetPaginatedMediasUseCase(repository);
});

/// Provider for GetFilteredMediasUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredMediasUseCaseProvider = Provider<GetFilteredMediasUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return GetFilteredMediasUseCase(repository);
});

/// Provider for CountMediasUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countMediasUseCaseProvider = Provider<CountMediasUseCase>((ref) {
  final repository = ref.read(mediaRepositoryProvider);
  return CountMediasUseCase(repository);
});


// ==================== Review Repository Providers ====================

/// Provider for Review repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return ReviewRepositoryImpl(localDataSource);
});

// ==================== Review Use Case Providers ====================

/// Provider for CreateReviewUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createReviewUseCaseProvider = Provider<CreateReviewUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return CreateReviewUseCase(repository);
});

/// Provider for GetReviewByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getReviewByIdUseCaseProvider = Provider<GetReviewByIdUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return GetReviewByIdUseCase(repository);
});

/// Provider for GetAllReviewsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllReviewsUseCaseProvider = Provider<GetAllReviewsUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return GetAllReviewsUseCase(repository);
});

/// Provider for UpdateReviewUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateReviewUseCaseProvider = Provider<UpdateReviewUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return UpdateReviewUseCase(repository);
});

/// Provider for DeleteReviewUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteReviewUseCaseProvider = Provider<DeleteReviewUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return DeleteReviewUseCase(repository);
});

/// Provider for SearchReviewsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchReviewsUseCaseProvider = Provider<SearchReviewsUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return SearchReviewsUseCase(repository);
});

/// Provider for GetPaginatedReviewsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedReviewsUseCaseProvider = Provider<GetPaginatedReviewsUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return GetPaginatedReviewsUseCase(repository);
});

/// Provider for GetFilteredReviewsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredReviewsUseCaseProvider = Provider<GetFilteredReviewsUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return GetFilteredReviewsUseCase(repository);
});

/// Provider for CountReviewsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countReviewsUseCaseProvider = Provider<CountReviewsUseCase>((ref) {
  final repository = ref.read(reviewRepositoryProvider);
  return CountReviewsUseCase(repository);
});


// ==================== Tag Repository Providers ====================

/// Provider for Tag repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final tagRepositoryProvider = Provider<TagRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return TagRepositoryImpl(localDataSource);
});

// ==================== Tag Use Case Providers ====================

/// Provider for CreateTagUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createTagUseCaseProvider = Provider<CreateTagUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return CreateTagUseCase(repository);
});

/// Provider for GetTagByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getTagByIdUseCaseProvider = Provider<GetTagByIdUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return GetTagByIdUseCase(repository);
});

/// Provider for GetAllTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllTagsUseCaseProvider = Provider<GetAllTagsUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return GetAllTagsUseCase(repository);
});

/// Provider for UpdateTagUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateTagUseCaseProvider = Provider<UpdateTagUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return UpdateTagUseCase(repository);
});

/// Provider for DeleteTagUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteTagUseCaseProvider = Provider<DeleteTagUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return DeleteTagUseCase(repository);
});

/// Provider for SearchTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchTagsUseCaseProvider = Provider<SearchTagsUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return SearchTagsUseCase(repository);
});

/// Provider for GetPaginatedTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedTagsUseCaseProvider = Provider<GetPaginatedTagsUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return GetPaginatedTagsUseCase(repository);
});

/// Provider for GetFilteredTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredTagsUseCaseProvider = Provider<GetFilteredTagsUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return GetFilteredTagsUseCase(repository);
});

/// Provider for CountTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countTagsUseCaseProvider = Provider<CountTagsUseCase>((ref) {
  final repository = ref.read(tagRepositoryProvider);
  return CountTagsUseCase(repository);
});


// ==================== FlashcardTag Repository Providers ====================

/// Provider for FlashcardTag repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final flashcardTagRepositoryProvider = Provider<FlashcardTagRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return FlashcardTagRepositoryImpl(localDataSource);
});

// ==================== FlashcardTag Use Case Providers ====================

/// Provider for CreateFlashcardTagUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createFlashcardTagUseCaseProvider = Provider<CreateFlashcardTagUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return CreateFlashcardTagUseCase(repository);
});

/// Provider for GetFlashcardTagByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFlashcardTagByIdUseCaseProvider = Provider<GetFlashcardTagByIdUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return GetFlashcardTagByIdUseCase(repository);
});

/// Provider for GetAllFlashcardTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllFlashcardTagsUseCaseProvider = Provider<GetAllFlashcardTagsUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return GetAllFlashcardTagsUseCase(repository);
});

/// Provider for UpdateFlashcardTagUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateFlashcardTagUseCaseProvider = Provider<UpdateFlashcardTagUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return UpdateFlashcardTagUseCase(repository);
});

/// Provider for DeleteFlashcardTagUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteFlashcardTagUseCaseProvider = Provider<DeleteFlashcardTagUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return DeleteFlashcardTagUseCase(repository);
});

/// Provider for SearchFlashcardTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchFlashcardTagsUseCaseProvider = Provider<SearchFlashcardTagsUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return SearchFlashcardTagsUseCase(repository);
});

/// Provider for GetPaginatedFlashcardTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedFlashcardTagsUseCaseProvider = Provider<GetPaginatedFlashcardTagsUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return GetPaginatedFlashcardTagsUseCase(repository);
});

/// Provider for GetFilteredFlashcardTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredFlashcardTagsUseCaseProvider = Provider<GetFilteredFlashcardTagsUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return GetFilteredFlashcardTagsUseCase(repository);
});

/// Provider for CountFlashcardTagsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countFlashcardTagsUseCaseProvider = Provider<CountFlashcardTagsUseCase>((ref) {
  final repository = ref.read(flashcardTagRepositoryProvider);
  return CountFlashcardTagsUseCase(repository);
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

    'deck',

    'flashcard',

    'media',

    'review',

    'tag',

    'flashcard_tag',

  ];
});
