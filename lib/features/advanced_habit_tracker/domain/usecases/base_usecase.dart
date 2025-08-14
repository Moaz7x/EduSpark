
import '../../../../core/types/types.dart';



/// Abstract base class for all use cases in the domain layer.
///
/// This class provides common functionality and structure for use cases,
/// following Clean Architecture principles and ensuring consistency
/// across all business logic operations with functional error handling.
abstract class BaseUseCase<ReturnType, ParameterType> {
  /// Executes the use case with the given parameters.
  ///
  /// [params] The parameters required for the use case execution
  /// Returns Either<Failure, ReturnType> for functional error handling
  /// Left(Failure) for validation or business logic failures
  /// Right(ReturnType) for successful operations
  Future<Either<Failure, ReturnType>> call(ParameterType params);
}

/// Base class for use cases that don't require parameters.
///
/// This is useful for operations like "get all" or "count" that don't
/// need input parameters.
abstract class NoParamsUseCase<ReturnType> {
  /// Executes the use case without parameters.
  ///
  /// Returns Either<Failure, ReturnType> for functional error handling
  /// Left(Failure) for validation or business logic failures
  /// Right(ReturnType) for successful operations
  Future<Either<Failure, ReturnType>> call();
}

/// Parameters class for use cases that require an ID.
///
/// This provides a consistent way to pass ID parameters to use cases
/// and includes built-in validation.
class IdParams {
  final int id;

  const IdParams(this.id);

  /// Validates that the ID is valid (greater than 0).
  ///
  /// Returns ValidationFailure if the ID is invalid, null if valid
  ValidationFailure? validate() {
    if (id <= 0) {
      return ValidationFailure('Invalid ID: ID must be greater than 0');
    }
    return null;
  }
}

/// Parameters class for pagination use cases.
///
/// This provides a consistent way to pass pagination parameters
/// with built-in validation for page and limit values.
class PaginationParams {
  final int page;
  final int limit;

  const PaginationParams({
    required this.page,
    required this.limit,
  });

  /// Validates pagination parameters.
  ///
  /// Returns ValidationFailure if parameters are invalid, null if valid
  ValidationFailure? validate() {
    if (page < 0) {
      return ValidationFailure('Page number must be 0 or greater');
    }
    if (limit <= 0) {
      return ValidationFailure('Limit must be greater than 0');
    }
    if (limit > 100) {
      return ValidationFailure('Limit cannot exceed 100 items per page');
    }
    return null;
  }
}

/// Parameters class for search use cases.
///
/// This provides a consistent way to pass search queries
/// with built-in validation.
class SearchParams {
  final String query;

  const SearchParams(this.query);

  /// Validates the search query.
  ///
  /// Returns ValidationFailure if the query is invalid, null if valid
  ValidationFailure? validate() {
    if (query.trim().isEmpty) {
      return ValidationFailure('Search query cannot be empty');
    }
    if (query.length < 2) {
      return ValidationFailure('Search query must be at least 2 characters long');
    }
    return null;
  }

  /// Returns the trimmed query string.
  String get trimmedQuery => query.trim();
}

/// Parameters class for filter use cases.
///
/// This provides a consistent way to pass filter criteria
/// with built-in validation.
class FilterParams {
  final Map<String, dynamic> filters;

  const FilterParams(this.filters);

  /// Validates the filter parameters.
  ///
  /// [validFields] List of valid field names for filtering
  /// Returns ValidationFailure if filters are invalid, null if valid
  ValidationFailure? validate(List<String> validFields) {
    if (filters.isEmpty) {
      return ValidationFailure('At least one filter must be provided');
    }

    for (final filterKey in filters.keys) {
      if (!validFields.contains(filterKey)) {
        return ValidationFailure('Invalid filter field: $filterKey');
      }
      if (filters[filterKey] == null) {
        return ValidationFailure('Filter value cannot be null for field: $filterKey');
      }
    }
    return null;
  }
}

/// Parameters class for update use cases when entity doesn't have an ID field.
///
/// This provides a consistent way to pass both the ID and entity data
/// for update operations.
class UpdateParams<T> {
  final int id;
  final T entity;

  const UpdateParams({
    required this.id,
    required this.entity,
  });

  /// Validates the update parameters.
  ///
  /// Returns ValidationFailure if parameters are invalid, null if valid
  ValidationFailure? validate() {
    if (id <= 0) {
      return ValidationFailure('ID must be greater than 0 for update operation');
    }
    if (entity == null) {
      return ValidationFailure('Entity cannot be null for update operation');
    }
    return null;
  }
}

// All exceptions are now defined in core/exceptions/exceptions.dart
