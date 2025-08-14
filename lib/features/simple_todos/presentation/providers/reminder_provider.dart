import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/base_usecase.dart';
import '../../domain/entities/reminder_entity.dart';
import '../../data/providers/simple_todos_data_providers.dart';
import 'provider_states.dart';

// ============================================================================
// REMINDER PROVIDERS
// ============================================================================

/// Main state provider for Reminder list with performance optimizations
final reminderListProvider = StateNotifierProvider.autoDispose<ReminderListNotifier, AsyncValue<List<ReminderEntity>>>((ref) {
  return ReminderListNotifier(ref);
});

/// Search state provider for Reminder with debouncing
final reminderSearchProvider = StateNotifierProvider.autoDispose<ReminderSearchNotifier, SearchState>((ref) {
  return ReminderSearchNotifier(ref);
});

/// Filter state provider for Reminder with optimization
final reminderFilterProvider = StateNotifierProvider.autoDispose<ReminderFilterNotifier, FilterState>((ref) {
  return ReminderFilterNotifier(ref);
});

/// Pagination state provider for Reminder with optimization
final reminderPaginationProvider = StateNotifierProvider.autoDispose<ReminderPaginationNotifier, PaginationState>((ref) {
  return ReminderPaginationNotifier(ref);
});

/// Loading states for different operations
final reminderLoadingProvider = StateProvider<Map<String, bool>>((ref) => {});

/// Selected Reminder provider for detail views
final selectedReminderProvider = StateProvider<ReminderEntity?>((ref) => null);

/// Batch selection provider for bulk operations
final selectedReminderIdsProvider = StateProvider<Set<int>>((ref) => {});

/// Computed provider for filtered reminder count
final reminderCountProvider = Provider<int>((ref) {
  return ref.watch(reminderListProvider).when(
    data: (reminders) => reminders.length,
    loading: () => 0,
    error: (_, __) => 0,
  );
});

/// Computed provider for selected reminder count
final selectedReminderCountProvider = Provider<int>((ref) {
  return ref.watch(selectedReminderIdsProvider).length;
});

/// Computed provider for loading state
final reminderIsLoadingProvider = Provider<bool>((ref) {
  final loadingStates = ref.watch(reminderLoadingProvider);
  return loadingStates.values.any((isLoading) => isLoading);
});

// ============================================================================
// REMINDER NOTIFIERS
// ============================================================================

/// Notifier for managing Reminder list state
class ReminderListNotifier extends StateNotifier<AsyncValue<List<ReminderEntity>>> {
  final Ref ref;
  List<ReminderEntity> _allItems = [];
  List<ReminderEntity> _filteredItems = [];

  ReminderListNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAll();
  }

  /// Loads all reminders
  Future<void> loadAll() async {
    try {
      final useCase = ref.read(getAllRemindersUseCaseProvider);
      final result = await useCase.call();
      result.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.current),
        (reminders) {
          _allItems = reminders;
          _applyFiltersAndSearch();
        },
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Creates a new reminder
  Future<void> create(ReminderEntity reminder) async {
    try {
      final useCase = ref.read(createReminderUseCaseProvider);
      final result = await useCase.call(reminder);
      result.fold(
        (failure) => throw failure,
        (reminder) {
          _allItems.add(reminder);
          _applyFiltersAndSearch();
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Updates an existing reminder
  Future<void> update(ReminderEntity reminder) async {
    try {
      final useCase = ref.read(updateReminderUseCaseProvider);
      final params = UpdateParams<ReminderEntity>(
        id: reminder.id!,
        entity: reminder,
      );
      params.validate();
      final result = await useCase.call(params);
      result.fold(
        (failure) => throw failure,
        (reminder) {
          final index = _allItems.indexWhere((item) => item.id == reminder.id);
          if (index != -1) {
            _allItems[index] = reminder;
            _applyFiltersAndSearch();
          }
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Deletes a reminder
  Future<void> delete(int id) async {
    try {
      final useCase = ref.read(deleteReminderUseCaseProvider);
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

  /// Gets a reminder by ID
  Future<ReminderEntity?> getById(int id) async {
    try {
      final useCase = ref.read(getReminderByIdUseCaseProvider);
      final params = IdParams(id);
      params.validate();
      final result = await useCase.call(params);
      return result.fold(
        (failure) => throw failure,
        (reminder) => reminder,
      );
    } catch (error) {
      return null;
    }
  }

  /// Applies current filters and search to the data
  void _applyFiltersAndSearch() {
    final searchState = ref.read(reminderSearchProvider);
    final filterState = ref.read(reminderFilterProvider);

    var filtered = List<ReminderEntity>.from(_allItems);

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
    final pagination = ref.read(reminderPaginationProvider);
    final startIndex = (pagination.currentPage - 1) * pagination.itemsPerPage;

    final paginatedItems = filtered.skip(startIndex).take(pagination.itemsPerPage).toList();

    state = AsyncValue.data(paginatedItems);
    _updatePagination();
  }

  /// Updates pagination state based on current data
  void _updatePagination() {
    final totalItems = _filteredItems.length;
    ref.read(reminderPaginationProvider.notifier).updateTotalItems(totalItems);
  }

  /// Loads an entity with all its relationships
  Future<ReminderEntity> loadWithRelationships(ReminderEntity entity) async {
    try {
      final repository = ref.read(reminderRepositoryProvider);
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
  Future<void> saveWithRelationships(ReminderEntity entity, {List<dynamic>? childEntities}) async {
    try {
      final repository = ref.read(reminderRepositoryProvider);
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
      final repository = ref.read(reminderRepositoryProvider);
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
      final repository = ref.read(reminderRepositoryProvider);
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

/// Notifier for managing Reminder search state
class ReminderSearchNotifier extends StateNotifier<SearchState> {
  final Ref ref;

  ReminderSearchNotifier(this.ref) : super(const SearchState());

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
    ref.read(reminderListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing Reminder filter state
class ReminderFilterNotifier extends StateNotifier<FilterState> {
  final Ref ref;

  ReminderFilterNotifier(this.ref) : super(const FilterState());

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
    ref.read(reminderListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing Reminder pagination state
class ReminderPaginationNotifier extends StateNotifier<PaginationState> {
  final Ref ref;

  ReminderPaginationNotifier(this.ref) : super(const PaginationState());

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
    ref.read(reminderListProvider.notifier)._applyFiltersAndSearch();
  }
}

