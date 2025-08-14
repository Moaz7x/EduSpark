import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/base_usecase.dart';
import '../../domain/entities/task_entity.dart';
import '../../data/providers/advanced_pomodoro_data_providers.dart';
import 'provider_states.dart';

// ============================================================================
// TASK PROVIDERS
// ============================================================================

/// Main state provider for Task list with performance optimizations
final taskListProvider = StateNotifierProvider.autoDispose<TaskListNotifier, AsyncValue<List<TaskEntity>>>((ref) {
  return TaskListNotifier(ref);
});

/// Search state provider for Task with debouncing
final taskSearchProvider = StateNotifierProvider.autoDispose<TaskSearchNotifier, SearchState>((ref) {
  return TaskSearchNotifier(ref);
});

/// Filter state provider for Task with optimization
final taskFilterProvider = StateNotifierProvider.autoDispose<TaskFilterNotifier, FilterState>((ref) {
  return TaskFilterNotifier(ref);
});

/// Pagination state provider for Task with optimization
final taskPaginationProvider = StateNotifierProvider.autoDispose<TaskPaginationNotifier, PaginationState>((ref) {
  return TaskPaginationNotifier(ref);
});

/// Loading states for different operations
final taskLoadingProvider = StateProvider<Map<String, bool>>((ref) => {});

/// Selected Task provider for detail views
final selectedTaskProvider = StateProvider<TaskEntity?>((ref) => null);

/// Batch selection provider for bulk operations
final selectedTaskIdsProvider = StateProvider<Set<int>>((ref) => {});

/// Computed provider for filtered task count
final taskCountProvider = Provider<int>((ref) {
  return ref.watch(taskListProvider).when(
    data: (tasks) => tasks.length,
    loading: () => 0,
    error: (_, __) => 0,
  );
});

/// Computed provider for selected task count
final selectedTaskCountProvider = Provider<int>((ref) {
  return ref.watch(selectedTaskIdsProvider).length;
});

/// Computed provider for loading state
final taskIsLoadingProvider = Provider<bool>((ref) {
  final loadingStates = ref.watch(taskLoadingProvider);
  return loadingStates.values.any((isLoading) => isLoading);
});

// ============================================================================
// TASK NOTIFIERS
// ============================================================================

/// Notifier for managing Task list state
class TaskListNotifier extends StateNotifier<AsyncValue<List<TaskEntity>>> {
  final Ref ref;
  List<TaskEntity> _allItems = [];
  List<TaskEntity> _filteredItems = [];

  TaskListNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAll();
  }

  /// Loads all tasks
  Future<void> loadAll() async {
    try {
      final useCase = ref.read(getAllTasksUseCaseProvider);
      final result = await useCase.call();
      result.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.current),
        (tasks) {
          _allItems = tasks;
          _applyFiltersAndSearch();
        },
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Creates a new task
  Future<void> create(TaskEntity task) async {
    try {
      final useCase = ref.read(createTaskUseCaseProvider);
      final result = await useCase.call(task);
      result.fold(
        (failure) => throw failure,
        (task) {
          _allItems.add(task);
          _applyFiltersAndSearch();
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Updates an existing task
  Future<void> update(TaskEntity task) async {
    try {
      final useCase = ref.read(updateTaskUseCaseProvider);
      final params = UpdateParams<TaskEntity>(
        id: task.id!,
        entity: task,
      );
      params.validate();
      final result = await useCase.call(params);
      result.fold(
        (failure) => throw failure,
        (task) {
          final index = _allItems.indexWhere((item) => item.id == task.id);
          if (index != -1) {
            _allItems[index] = task;
            _applyFiltersAndSearch();
          }
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  /// Deletes a task
  Future<void> delete(int id) async {
    try {
      final useCase = ref.read(deleteTaskUseCaseProvider);
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

  /// Gets a task by ID
  Future<TaskEntity?> getById(int id) async {
    try {
      final useCase = ref.read(getTaskByIdUseCaseProvider);
      final params = IdParams(id);
      params.validate();
      final result = await useCase.call(params);
      return result.fold(
        (failure) => throw failure,
        (task) => task,
      );
    } catch (error) {
      return null;
    }
  }

  /// Applies current filters and search to the data
  void _applyFiltersAndSearch() {
    final searchState = ref.read(taskSearchProvider);
    final filterState = ref.read(taskFilterProvider);

    var filtered = List<TaskEntity>.from(_allItems);

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
    final pagination = ref.read(taskPaginationProvider);
    final startIndex = (pagination.currentPage - 1) * pagination.itemsPerPage;

    final paginatedItems = filtered.skip(startIndex).take(pagination.itemsPerPage).toList();

    state = AsyncValue.data(paginatedItems);
    _updatePagination();
  }

  /// Updates pagination state based on current data
  void _updatePagination() {
    final totalItems = _filteredItems.length;
    ref.read(taskPaginationProvider.notifier).updateTotalItems(totalItems);
  }

  /// Loads an entity with all its relationships
  Future<TaskEntity> loadWithRelationships(TaskEntity entity) async {
    try {
      final repository = ref.read(taskRepositoryProvider);
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
  Future<void> saveWithRelationships(TaskEntity entity, {List<dynamic>? childEntities}) async {
    try {
      final repository = ref.read(taskRepositoryProvider);
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
      final repository = ref.read(taskRepositoryProvider);
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
      final repository = ref.read(taskRepositoryProvider);
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

/// Notifier for managing Task search state
class TaskSearchNotifier extends StateNotifier<SearchState> {
  final Ref ref;

  TaskSearchNotifier(this.ref) : super(const SearchState());

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
    ref.read(taskListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing Task filter state
class TaskFilterNotifier extends StateNotifier<FilterState> {
  final Ref ref;

  TaskFilterNotifier(this.ref) : super(const FilterState());

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
    ref.read(taskListProvider.notifier)._applyFiltersAndSearch();
  }
}

/// Notifier for managing Task pagination state
class TaskPaginationNotifier extends StateNotifier<PaginationState> {
  final Ref ref;

  TaskPaginationNotifier(this.ref) : super(const PaginationState());

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
    ref.read(taskListProvider.notifier)._applyFiltersAndSearch();
  }
}

