import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/base_usecase.dart';
import '../../domain/entities/habit_entity.dart';
import '../../data/providers/advanced_habit_tracker_data_providers.dart';
import 'provider_states.dart';

// ============================================================================
// HABIT PROVIDERS
// ============================================================================

/// Main state provider for Habit list with performance optimizations
final habitListProvider = StateNotifierProvider.autoDispose<HabitListNotifier, AsyncValue<List<HabitEntity>>>((ref) {
  return HabitListNotifier(ref);
});

/// Search state provider for Habit with debouncing
final habitSearchProvider = StateNotifierProvider.autoDispose<HabitSearchNotifier, SearchState>((ref) {
  return HabitSearchNotifier(ref);
});

/// Filter state provider for Habit with optimization
final habitFilterProvider = StateNotifierProvider.autoDispose<HabitFilterNotifier, FilterState>((ref) {
  return HabitFilterNotifier(ref);
});

/// Pagination state provider for Habit with optimization
final habitPaginationProvider = StateNotifierProvider.autoDispose<HabitPaginationNotifier, PaginationState>((ref) {
  return HabitPaginationNotifier(ref);
});

/// Loading states for different operations
final habitLoadingProvider = StateProvider<Map<String, bool>>((ref) => {});

/// Selected Habit provider for detail views
final selectedHabitProvider = StateProvider<HabitEntity?>((ref) => null);

/// Batch selection provider for bulk operations
final selectedHabitIdsProvider = StateProvider<Set<int>>((ref) => {});

/// Computed provider for filtered habit count
final habitCountProvider = Provider<int>((ref) {
  return ref.watch(habitListProvider).when(
    data: (habits) => habits.length,
    loading: () => 0,
    error: (_, __) => 0,
  );
});

/// Computed provider for selected habit count
final selectedHabitCountProvider = Provider<int>((ref) {
  return ref.watch(selectedHabitIdsProvider).length;
});

/// Computed provider for loading state
final habitIsLoadingProvider = Provider<bool>((ref) {
  final loadingStates = ref.watch(habitLoadingProvider);
  return loadingStates.values.any((isLoading) => isLoading);
});

// ============================================================================
// HABIT NOTIFIERS
// ============================================================================

/// Notifier for managing Habit list state
class HabitListNotifier extends StateNotifier<AsyncValue<List<HabitEntity>>> {
  final Ref ref;
  List<HabitEntity> _allItems = [];
  List<HabitEntity> _filteredItems = [];

  HabitListNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAll();
  }

  /// Loads all habits
  Future<void> loadAll() async {
    try {
      final useCase = ref.read(getAllHabitsUseCaseProvider);
      final result = await useCase.call();
      result.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.current),
        (habits) {
          _allItems = habits;
          _applyFiltersAndSearch();
        },
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Creates a new habit
  Future<void> create(HabitEntity habit) async {
    try {
      final useCase = ref.read(createHabitUseCaseProvider);
      final result = await useCase.call(habit);
      result.fold(
        (failure) => throw failure,
        (habit) {
          _allItems.add(habit);
          _applyFiltersAndSearch();
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Updates an existing habit
  Future<void> update(HabitEntity habit) async {
    try {
      final useCase = ref.read(updateHabitUseCaseProvider);
      final params = UpdateParams<HabitEntity>(
        id: habit.id!,
        entity: habit,
      );
      params.validate();
      final result = await useCase.call(params);
      result.fold(
        (failure) => throw failure,
        (habit) {
          final index = _allItems.indexWhere((item) => item.id == habit.id);
          if (index != -1) {
            _allItems[index] = habit;
            _applyFiltersAndSearch();
          }
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Deletes a habit
  Future<void> delete(int id) async {
    try {
      final useCase = ref.read(deleteHabitUseCaseProvider);
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

  /// Gets a habit by ID
  Future<HabitEntity?> getById(int id) async {
    try {
      final useCase = ref.read(getHabitByIdUseCaseProvider);
      final params = IdParams(id);
      params.validate();
      final result = await useCase.call(params);
      return result.fold(
        (failure) => throw failure,
        (habit) => habit,
      );
    } catch (error) {
      return null;
    }
  }

  /// Applies current filters and search to the data
  void _applyFiltersAndSearch() {
    final searchState = ref.read(habitSearchProvider);
    final filterState = ref.read(habitFilterProvider);

    var filtered = List<HabitEntity>.from(_allItems);

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
    final pagination = ref.read(habitPaginationProvider);
    final startIndex = (pagination.currentPage - 1) * pagination.itemsPerPage;

    final paginatedItems = filtered.skip(startIndex).take(pagination.itemsPerPage).toList();

    state = AsyncValue.data(paginatedItems);
    _updatePagination();
  }

  /// Updates pagination state based on current data
  void _updatePagination() {
    final totalItems = _filteredItems.length;
    ref.read(habitPaginationProvider.notifier).updateTotalItems(totalItems);
  }

  /// Loads an entity with all its relationships
  Future<HabitEntity> loadWithRelationships(HabitEntity entity) async {
    try {
      final repository = ref.read(habitRepositoryProvider);
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
  Future<void> saveWithRelationships(HabitEntity entity, {List<dynamic>? childEntities}) async {
    try {
      final repository = ref.read(habitRepositoryProvider);
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
      final repository = ref.read(habitRepositoryProvider);
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
      final repository = ref.read(habitRepositoryProvider);
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

/// Notifier for managing Habit search state
class HabitSearchNotifier extends StateNotifier<SearchState> {
  final Ref ref;

  HabitSearchNotifier(this.ref) : super(const SearchState());

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
    ref.read(habitListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing Habit filter state
class HabitFilterNotifier extends StateNotifier<FilterState> {
  final Ref ref;

  HabitFilterNotifier(this.ref) : super(const FilterState());

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
    ref.read(habitListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing Habit pagination state
class HabitPaginationNotifier extends StateNotifier<PaginationState> {
  final Ref ref;

  HabitPaginationNotifier(this.ref) : super(const PaginationState());

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
    ref.read(habitListProvider.notifier)._applyFiltersAndSearch();
  }
}

