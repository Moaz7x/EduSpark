import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/base_usecase.dart';
import '../../domain/entities/media_entity.dart';
import '../../data/providers/advanced_flashcards_data_providers.dart';
import 'provider_states.dart';

// ============================================================================
// MEDIA PROVIDERS
// ============================================================================

/// Main state provider for Media list with performance optimizations
final mediaListProvider = StateNotifierProvider.autoDispose<MediaListNotifier, AsyncValue<List<MediaEntity>>>((ref) {
  return MediaListNotifier(ref);
});

/// Search state provider for Media with debouncing
final mediaSearchProvider = StateNotifierProvider.autoDispose<MediaSearchNotifier, SearchState>((ref) {
  return MediaSearchNotifier(ref);
});

/// Filter state provider for Media with optimization
final mediaFilterProvider = StateNotifierProvider.autoDispose<MediaFilterNotifier, FilterState>((ref) {
  return MediaFilterNotifier(ref);
});

/// Pagination state provider for Media with optimization
final mediaPaginationProvider = StateNotifierProvider.autoDispose<MediaPaginationNotifier, PaginationState>((ref) {
  return MediaPaginationNotifier(ref);
});

/// Loading states for different operations
final mediaLoadingProvider = StateProvider<Map<String, bool>>((ref) => {});

/// Selected Media provider for detail views
final selectedMediaProvider = StateProvider<MediaEntity?>((ref) => null);

/// Batch selection provider for bulk operations
final selectedMediaIdsProvider = StateProvider<Set<int>>((ref) => {});

/// Computed provider for filtered media count
final mediaCountProvider = Provider<int>((ref) {
  return ref.watch(mediaListProvider).when(
    data: (medias) => medias.length,
    loading: () => 0,
    error: (_, __) => 0,
  );
});

/// Computed provider for selected media count
final selectedMediaCountProvider = Provider<int>((ref) {
  return ref.watch(selectedMediaIdsProvider).length;
});

/// Computed provider for loading state
final mediaIsLoadingProvider = Provider<bool>((ref) {
  final loadingStates = ref.watch(mediaLoadingProvider);
  return loadingStates.values.any((isLoading) => isLoading);
});

// ============================================================================
// MEDIA NOTIFIERS
// ============================================================================

/// Notifier for managing Media list state
class MediaListNotifier extends StateNotifier<AsyncValue<List<MediaEntity>>> {
  final Ref ref;
  List<MediaEntity> _allItems = [];
  List<MediaEntity> _filteredItems = [];

  MediaListNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAll();
  }

  /// Loads all medias
  Future<void> loadAll() async {
    try {
      final useCase = ref.read(getAllMediasUseCaseProvider);
      final result = await useCase.call();
      result.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.current),
        (medias) {
          _allItems = medias;
          _applyFiltersAndSearch();
        },
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Creates a new media
  Future<void> create(MediaEntity media) async {
    try {
      final useCase = ref.read(createMediaUseCaseProvider);
      final result = await useCase.call(media);
      result.fold(
        (failure) => throw failure,
        (media) {
          _allItems.add(media);
          _applyFiltersAndSearch();
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Updates an existing media
  Future<void> update(MediaEntity media) async {
    try {
      final useCase = ref.read(updateMediaUseCaseProvider);
      final params = UpdateParams<MediaEntity>(
        id: media.id!,
        entity: media,
      );
      params.validate();
      final result = await useCase.call(params);
      result.fold(
        (failure) => throw failure,
        (media) {
          final index = _allItems.indexWhere((item) => item.id == media.id);
          if (index != -1) {
            _allItems[index] = media;
            _applyFiltersAndSearch();
          }
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Deletes a media
  Future<void> delete(int id) async {
    try {
      final useCase = ref.read(deleteMediaUseCaseProvider);
      final params = IdParams(id);
      params.validate();
      final result = await useCase.call(params);
      result.fold(
        (failure) => throw failure,
        (success) {
          if (success == true) {
            _allItems.removeWhere((item) => item.id == id);
            _applyFiltersAndSearch();
          }
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Gets a media by ID
  Future<MediaEntity?> getById(int id) async {
    try {
      final useCase = ref.read(getMediaByIdUseCaseProvider);
      final params = IdParams(id);
      params.validate();
      final result = await useCase.call(params);
      return result.fold(
        (failure) => throw failure,
        (media) => media,
      );
    } catch (error) {
      return null;
    }
  }

  /// Applies current filters and search to the data
  void _applyFiltersAndSearch() {
    final searchState = ref.read(mediaSearchProvider);
    final filterState = ref.read(mediaFilterProvider);

    var filtered = List<MediaEntity>.from(_allItems);

    // Apply search
    if (searchState.query.isNotEmpty) {
      filtered = filtered.where((item) {
        // Implement search logic based on entity fields
        return item.toString().toLowerCase().contains(searchState.query.toLowerCase());
      }).toList();
    }

    // Apply filters
    // TODO: Implement filtering logic based on entity fields

    // Apply sorting
    if (filterState.sortField.isNotEmpty) {
      // TODO: Implement sorting logic based on entity fields
    }

    _filteredItems = filtered;

    // Apply pagination
    final pagination = ref.read(mediaPaginationProvider);
    final startIndex = (pagination.currentPage - 1) * pagination.itemsPerPage;

    final paginatedItems = filtered.skip(startIndex).take(pagination.itemsPerPage).toList();

    state = AsyncValue.data(paginatedItems);
    _updatePagination();
  }

  /// Updates pagination state based on current data
  void _updatePagination() {
    final totalItems = _filteredItems.length;
    ref.read(mediaPaginationProvider.notifier).updateTotalItems(totalItems);
  }

  /// Loads an entity with all its relationships
  Future<MediaEntity> loadWithRelationships(MediaEntity entity) async {
    try {
      final repository = ref.read(mediaRepositoryProvider);
      final result = await repository.loadWithRelationships(entity);
      return result.fold(
        (failure) => throw failure,
        (entity) => entity,
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Saves an entity with all its relationships in a single transaction
  Future<void> saveWithRelationships(MediaEntity entity, {List<dynamic>? childEntities}) async {
    try {
      final repository = ref.read(mediaRepositoryProvider);
      final result = await repository.saveWithRelationships(entity, childEntities: childEntities);
      result.fold(
        (failure) => throw failure,
        (isSuccess) {
          if (isSuccess == true) {
            // Refresh the list to show updated data
            loadAll();
          }
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Clears all data for this entity type and its related entities
  Future<void> clearWithRelationships() async {
    try {
      final repository = ref.read(mediaRepositoryProvider);
      final result = await repository.clearWithRelationships();
      result.fold(
        (failure) => throw failure,
        (isSuccess) {
          if (isSuccess == true) {
            _allItems.clear();
            _applyFiltersAndSearch();
          }
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Gets all child entities for a given parent entity
  Future<List<T>> getChildEntities<T>(int parentId, String childType) async {
    try {
      final repository = ref.read(mediaRepositoryProvider);
      final result = await repository.getChildEntities<T>(parentId, childType);
      return result.fold(
        (failure) => throw failure,
        (entities) => entities,
      );
    } catch (error) {
      rethrow;
    }
  }
}

/// Notifier for managing Media search state
class MediaSearchNotifier extends StateNotifier<SearchState> {
  final Ref ref;

  MediaSearchNotifier(this.ref) : super(const SearchState());

  /// Updates the search query and triggers search
  void updateQuery(String query) {
    state = state.copyWith(query: query, isSearching: query.isNotEmpty);
    _triggerSearch();
  }

  /// Toggles search mode on/off
  void toggleSearch() {
    if (state.isSearching) {
      clearSearch();
    } else {
      state = state.copyWith(isSearching: true);
    }
  }

  /// Configures which fields are searchable
  void setSearchFields(List<String> fields) {
    state = state.copyWith(searchFields: fields);
    if (state.query.isNotEmpty) {
      _triggerSearch();
    }
  }

  /// Clears search results and resets search state
  void clearSearch() {
    state = const SearchState();
    _triggerSearch();
  }

  /// Triggers search operation in the list notifier
  void _triggerSearch() {
    // Notify the list notifier to apply search
    ref.read(mediaListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing Media filter state
class MediaFilterNotifier extends StateNotifier<FilterState> {
  final Ref ref;

  MediaFilterNotifier(this.ref) : super(const FilterState());

  /// Adds or updates a filter
  void addFilter(String key, dynamic value) {
    final newFilters = Map<String, dynamic>.from(state.filters);
    newFilters[key] = value;
    state = state.copyWith(filters: newFilters);
    _triggerFilter();
  }

  /// Removes a filter
  void removeFilter(String key) {
    final newFilters = Map<String, dynamic>.from(state.filters);
    newFilters.remove(key);
    state = state.copyWith(filters: newFilters);
    _triggerFilter();
  }

  /// Clears all filters
  void clearAllFilters() {
    state = state.copyWith(filters: {});
    _triggerFilter();
  }

  /// Sets the sort field and direction
  void setSortField(String field, {bool ascending = true}) {
    state = state.copyWith(
      sortField: field,
      sortAscending: ascending,
    );
    _triggerFilter();
  }

  /// Toggles sort direction for current field
  void toggleSortDirection() {
    state = state.copyWith(sortAscending: !state.sortAscending);
    _triggerFilter();
  }

  /// Clears sorting
  void clearSort() {
    state = state.copyWith(sortField: '', sortAscending: true);
    _triggerFilter();
  }

  /// Triggers filter operation in the list notifier
  void _triggerFilter() {
    // Notify the list notifier to apply filters
    ref.read(mediaListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing Media pagination state
class MediaPaginationNotifier extends StateNotifier<PaginationState> {
  final Ref ref;

  MediaPaginationNotifier(this.ref) : super(const PaginationState());

  /// Navigates to a specific page
  void goToPage(int page) {
    if (page >= 1) {
      state = state.copyWith(currentPage: page);
      _triggerPagination();
    }
  }

  /// Navigates to the next page
  void nextPage() {
    if (state.hasNextPage) {
      state = state.copyWith(currentPage: state.currentPage + 1);
      _triggerPagination();
    }
  }

  /// Navigates to the previous page
  void previousPage() {
    if (state.hasPreviousPage) {
      state = state.copyWith(currentPage: state.currentPage - 1);
      _triggerPagination();
    }
  }

  /// Sets the number of items per page
  void setItemsPerPage(int itemsPerPage) {
    if (itemsPerPage > 0) {
      state = state.copyWith(
        itemsPerPage: itemsPerPage,
        currentPage: 1, // Reset to first page
      );
      _triggerPagination();
    }
  }

  /// Updates total items count and recalculates pagination
  void updateTotalItems(int totalItems) {
    final totalPages = (totalItems / state.itemsPerPage).ceil();
    final hasNextPage = state.currentPage < totalPages;
    final hasPreviousPage = state.currentPage > 1;

    state = state.copyWith(
      totalItems: totalItems,
      hasNextPage: hasNextPage,
      hasPreviousPage: hasPreviousPage,
    );
  }

  /// Resets pagination to first page
  void reset() {
    state = state.copyWith(currentPage: 1);
    _triggerPagination();
  }

  /// Triggers pagination operation in the list notifier
  void _triggerPagination() {
    // Notify the list notifier to apply pagination
    ref.read(mediaListProvider.notifier)._applyFiltersAndSearch();
  }
}

