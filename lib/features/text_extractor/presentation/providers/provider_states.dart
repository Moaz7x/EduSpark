// Generated provider states for text_extractor feature
// This file contains shared state classes used by all entity providers


// ============================================================================
// SEARCH & FILTER STATE CLASSES
// ============================================================================

class SearchState {
  final String query;
  final bool isSearching;
  final List<String> searchFields;

  const SearchState({
    this.query = '',
    this.isSearching = false,
    this.searchFields = const [],
  });

  SearchState copyWith({
    String? query,
    bool? isSearching,
    List<String>? searchFields,
  }) {
    return SearchState(
      query: query ?? this.query,
      isSearching: isSearching ?? this.isSearching,
      searchFields: searchFields ?? this.searchFields,
    );
  }
}

class FilterState {
  final Map<String, dynamic> filters;
  final String sortField;
  final bool sortAscending;

  const FilterState({
    this.filters = const {},
    this.sortField = '',
    this.sortAscending = true,
  });

  FilterState copyWith({
    Map<String, dynamic>? filters,
    String? sortField,
    bool? sortAscending,
  }) {
    return FilterState(
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortAscending: sortAscending ?? this.sortAscending,
    );
  }
}

class PaginationState {
  final int currentPage;
  final int itemsPerPage;
  final int totalItems;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginationState({
    this.currentPage = 1,
    this.itemsPerPage = 10,
    this.totalItems = 0,
    this.hasNextPage = false,
    this.hasPreviousPage = false,
  });

  PaginationState copyWith({
    int? currentPage,
    int? itemsPerPage,
    int? totalItems,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) {
    return PaginationState(
      currentPage: currentPage ?? this.currentPage,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      totalItems: totalItems ?? this.totalItems,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
    );
  }
}

