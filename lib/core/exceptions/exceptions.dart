/// Core exceptions for the AdvancedHabitTracker feature.
///
/// This file contains all shared exception classes used across different layers
/// of the Clean Architecture implementation.
library;

/// Exception thrown when use case validation or business logic fails.
/// 
/// This provides a clean way to handle domain layer errors and validation failures.
class UseCaseException implements Exception {
  final String message;
  final dynamic originalError;
  
  const UseCaseException(this.message, [this.originalError]);
  
  @override
  String toString() => 'UseCaseException: $message';
}

/// Exception thrown when repository operations fail.
/// 
/// This provides a clean way to handle data layer errors across the application.
class RepositoryException implements Exception {
  final String message;
  final dynamic originalError;
  
  const RepositoryException(this.message, [this.originalError]);
  
  @override
  String toString() => 'RepositoryException: $message';
}

/// Exception thrown when data source operations fail.
/// 
/// This provides a clean way to handle data source specific errors.
class DataSourceException implements Exception {
  final String message;
  final dynamic originalError;
  
  const DataSourceException(this.message, [this.originalError]);
  
  @override
  String toString() => 'DataSourceException: $message';
}

/// Exception thrown when network operations fail.
/// 
/// This provides a clean way to handle network-related errors.
class NetworkException implements Exception {
  final String message;
  final dynamic originalError;
  
  const NetworkException(this.message, [this.originalError]);
  
  @override
  String toString() => 'NetworkException: $message';
}

/// Exception thrown when cache operations fail.
/// 
/// This provides a clean way to handle cache-related errors.
class CacheException implements Exception {
  final String message;
  final dynamic originalError;
  
  const CacheException(this.message, [this.originalError]);
  
  @override
  String toString() => 'CacheException: $message';
}

/// Exception thrown when validation fails.
/// 
/// This provides a clean way to handle validation errors across layers.
class ValidationException implements Exception {
  final String message;
  final Map<String, String>? fieldErrors;
  final dynamic originalError;
  
  const ValidationException(
    this.message, {
    this.fieldErrors,
    this.originalError,
  });
  
  @override
  String toString() {
    if (fieldErrors != null && fieldErrors!.isNotEmpty) {
      final errors = fieldErrors!.entries
          .map((e) => '${e.key}: ${e.value}')
          .join(', ');
      return 'ValidationException: $message ($errors)';
    }
    return 'ValidationException: $message';
  }
}
