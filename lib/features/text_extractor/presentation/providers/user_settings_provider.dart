import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/base_usecase.dart';
import '../../domain/entities/user_settings_entity.dart';
import '../../data/providers/text_extractor_data_providers.dart';
import 'provider_states.dart';

// ============================================================================
// USERSETTINGS PROVIDERS
// ============================================================================

/// Main state provider for UserSettings list with performance optimizations
final userSettingsListProvider = StateNotifierProvider.autoDispose<UserSettingsListNotifier, AsyncValue<List<UserSettingsEntity>>>((ref) {
  return UserSettingsListNotifier(ref);
});

/// Search state provider for UserSettings with debouncing
final userSettingsSearchProvider = StateNotifierProvider.autoDispose<UserSettingsSearchNotifier, SearchState>((ref) {
  return UserSettingsSearchNotifier(ref);
});

/// Filter state provider for UserSettings with optimization
final userSettingsFilterProvider = StateNotifierProvider.autoDispose<UserSettingsFilterNotifier, FilterState>((ref) {
  return UserSettingsFilterNotifier(ref);
});

/// Pagination state provider for UserSettings with optimization
final userSettingsPaginationProvider = StateNotifierProvider.autoDispose<UserSettingsPaginationNotifier, PaginationState>((ref) {
  return UserSettingsPaginationNotifier(ref);
});

/// Loading states for different operations
final userSettingsLoadingProvider = StateProvider<Map<String, bool>>((ref) => {});

/// Selected UserSettings provider for detail views
final selectedUserSettingsProvider = StateProvider<UserSettingsEntity?>((ref) => null);

/// Batch selection provider for bulk operations
final selectedUserSettingsIdsProvider = StateProvider<Set<int>>((ref) => {});

/// Computed provider for filtered userSettings count
final userSettingsCountProvider = Provider<int>((ref) {
  return ref.watch(userSettingsListProvider).when(
    data: (userSettingss) => userSettingss.length,
    loading: () => 0,
    error: (_, __) => 0,
  );
});

/// Computed provider for selected userSettings count
final selectedUserSettingsCountProvider = Provider<int>((ref) {
  return ref.watch(selectedUserSettingsIdsProvider).length;
});

/// Computed provider for loading state
final userSettingsIsLoadingProvider = Provider<bool>((ref) {
  final loadingStates = ref.watch(userSettingsLoadingProvider);
  return loadingStates.values.any((isLoading) => isLoading);
});

// ============================================================================
// USERSETTINGS NOTIFIERS
// ============================================================================

/// Notifier for managing UserSettings list state
class UserSettingsListNotifier extends StateNotifier<AsyncValue<List<UserSettingsEntity>>> {
  final Ref ref;
  List<UserSettingsEntity> _allItems = [];
  List<UserSettingsEntity> _filteredItems = [];

  UserSettingsListNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAll();
  }

  /// Loads all userSettingss
  Future<void> loadAll() async {
    try {
      final useCase = ref.read(getAllUserSettingssUseCaseProvider);
      final result = await useCase.call();
      result.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.current),
        (userSettingss) {
          _allItems = userSettingss;
          _applyFiltersAndSearch();
        },
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Creates a new userSettings
  Future<void> create(UserSettingsEntity userSettings) async {
    try {
      final useCase = ref.read(createUserSettingsUseCaseProvider);
      final result = await useCase.call(userSettings);
      result.fold(
        (failure) => throw failure,
        (userSettings) {
          _allItems.add(userSettings);
          _applyFiltersAndSearch();
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Updates an existing userSettings
  Future<void> update(UserSettingsEntity userSettings) async {
    try {
      final useCase = ref.read(updateUserSettingsUseCaseProvider);
      final params = UpdateParams<UserSettingsEntity>(
        id: userSettings.id!,
        entity: userSettings,
      );
      params.validate();
      final result = await useCase.call(params);
      result.fold(
        (failure) => throw failure,
        (userSettings) {
          final index = _allItems.indexWhere((item) => item.id == userSettings.id);
          if (index != -1) {
            _allItems[index] = userSettings;
            _applyFiltersAndSearch();
          }
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Deletes a userSettings
  Future<void> delete(int id) async {
    try {
      final useCase = ref.read(deleteUserSettingsUseCaseProvider);
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

  /// Gets a userSettings by ID
  Future<UserSettingsEntity?> getById(int id) async {
    try {
      final useCase = ref.read(getUserSettingsByIdUseCaseProvider);
      final params = IdParams(id);
      params.validate();
      final result = await useCase.call(params);
      return result.fold(
        (failure) => throw failure,
        (userSettings) => userSettings,
      );
    } catch (error) {
      return null;
    }
  }

  /// Applies current filters and search to the data
  void _applyFiltersAndSearch() {
    final searchState = ref.read(userSettingsSearchProvider);
    final filterState = ref.read(userSettingsFilterProvider);

    var filtered = List<UserSettingsEntity>.from(_allItems);

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
    final pagination = ref.read(userSettingsPaginationProvider);
    final startIndex = (pagination.currentPage - 1) * pagination.itemsPerPage;

    final paginatedItems = filtered.skip(startIndex).take(pagination.itemsPerPage).toList();

    state = AsyncValue.data(paginatedItems);
    _updatePagination();
  }

  /// Updates pagination state based on current data
  void _updatePagination() {
    final totalItems = _filteredItems.length;
    ref.read(userSettingsPaginationProvider.notifier).updateTotalItems(totalItems);
  }

  /// Loads an entity with all its relationships
  Future<UserSettingsEntity> loadWithRelationships(UserSettingsEntity entity) async {
    try {
      final repository = ref.read(userSettingsRepositoryProvider);
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
  Future<void> saveWithRelationships(UserSettingsEntity entity, {List<dynamic>? childEntities}) async {
    try {
      final repository = ref.read(userSettingsRepositoryProvider);
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
      final repository = ref.read(userSettingsRepositoryProvider);
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
      final repository = ref.read(userSettingsRepositoryProvider);
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

/// Notifier for managing UserSettings search state
class UserSettingsSearchNotifier extends StateNotifier<SearchState> {
  final Ref ref;

  UserSettingsSearchNotifier(this.ref) : super(const SearchState());

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
    ref.read(userSettingsListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing UserSettings filter state
class UserSettingsFilterNotifier extends StateNotifier<FilterState> {
  final Ref ref;

  UserSettingsFilterNotifier(this.ref) : super(const FilterState());

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
    ref.read(userSettingsListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing UserSettings pagination state
class UserSettingsPaginationNotifier extends StateNotifier<PaginationState> {
  final Ref ref;

  UserSettingsPaginationNotifier(this.ref) : super(const PaginationState());

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
    ref.read(userSettingsListProvider.notifier)._applyFiltersAndSearch();
  }
}

