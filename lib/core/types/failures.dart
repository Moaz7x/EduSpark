/// Failure hierarchy for functional error handling in Clean Architecture.
///
/// This file provides a comprehensive set of failure types that represent
/// different categories of errors that can occur throughout the application.
/// These failures are used with the Either type to provide type-safe error
/// handling without exceptions.
///
/// The failure hierarchy follows Clean Architecture principles, with specific
/// failure types for each layer (domain, data, presentation) and common
/// error scenarios (validation, network, storage, etc.).
library;

/// Abstract base class for all failures in the application.
///
/// This class provides a common interface for all error conditions that can
/// occur during application execution. It follows the functional programming
/// approach where errors are values rather than exceptions.
///
/// All concrete failure classes should extend this base class to ensure
/// consistency in error handling across the application.
///
/// Properties:
/// - [message]: Human-readable description of the failure
/// - [originalError]: Optional original error/exception that caused this failure
///
/// Example usage:
/// ```dart
/// Either<Failure, User> result = Left(ValidationFailure('Email is required'));
/// 
/// result.fold(
///   (failure) => print('Error: ${failure.message}'),
///   (user) => print('Success: ${user.name}'),
/// );
/// ```
abstract class Failure {
  /// Human-readable description of what went wrong.
  ///
  /// This message should be descriptive enough for developers to understand
  /// the issue, but may also be suitable for display to end users depending
  /// on the specific failure type.
  final String message;

  /// Optional original error or exception that caused this failure.
  ///
  /// This field is useful for debugging and logging purposes, allowing
  /// developers to trace the root cause of failures. It can contain
  /// exceptions, stack traces, or any other relevant error information.
  final dynamic originalError;

  /// Creates a new Failure with the given message and optional original error.
  ///
  /// Parameters:
  /// - [message]: Description of the failure
  /// - [originalError]: Optional original error that caused this failure
  const Failure(this.message, [this.originalError]);

  @override
  String toString() => message;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Failure &&
            other.runtimeType == runtimeType &&
            other.message == message);
  }

  @override
  int get hashCode => message.hashCode ^ runtimeType.hashCode;
}

/// Failure for validation errors in the domain layer (use cases).
///
/// This failure type represents errors that occur during input validation
/// or business rule enforcement in use cases. It indicates that the provided
/// data does not meet the requirements for the operation to proceed.
///
/// Common scenarios:
/// - Required fields are missing or empty
/// - Data format is invalid (e.g., invalid email format)
/// - Business rules are violated (e.g., age restrictions)
/// - Input parameters are out of acceptable ranges
///
/// Example usage:
/// ```dart
/// // In a use case
/// if (email.isEmpty) {
///   return Left(ValidationFailure('Email address is required'));
/// }
/// 
/// if (!isValidEmail(email)) {
///   return Left(ValidationFailure('Please enter a valid email address'));
/// }
/// ```
class ValidationFailure extends Failure {
  /// Creates a ValidationFailure with the given message and optional original error.
  ///
  /// Parameters:
  /// - [message]: Description of the validation error
  /// - [originalError]: Optional original error that caused this validation failure
  const ValidationFailure(String message, {dynamic originalError})
      : super(message, originalError);

  @override
  String toString() => 'ValidationFailure: $message';
}

/// Failure for repository layer errors.
///
/// This failure type represents errors that occur in the repository layer
/// when coordinating between the domain and data layers. It indicates
/// issues with data access operations or business logic enforcement
/// at the repository level.
///
/// Common scenarios:
/// - Data transformation errors between entities and models
/// - Business rule violations during data operations
/// - Coordination failures between multiple data sources
/// - Repository-specific validation errors
///
/// Example usage:
/// ```dart
/// // In a repository implementation
/// try {
///   final model = entity.toModel();
///   return Right(await dataSource.create(model));
/// } catch (e) {
///   return Left(RepositoryFailure('Failed to create entity', e));
/// }
/// ```
class RepositoryFailure extends Failure {
  /// Creates a RepositoryFailure with the given message and optional original error.
  ///
  /// Parameters:
  /// - [message]: Description of the repository error
  /// - [originalError]: Optional original error that caused this repository failure
  const RepositoryFailure(String message, [dynamic originalError])
      : super(message, originalError);

  @override
  String toString() => 'RepositoryFailure: $message';
}

/// Failure for data source operation errors.
///
/// This failure type represents errors that occur at the data source level,
/// such as database operations, network requests, file system access, or
/// external API calls. It indicates low-level data access problems.
///
/// Common scenarios:
/// - Database connection failures
/// - SQL query execution errors
/// - File system permission issues
/// - Network connectivity problems
/// - External API errors or timeouts
/// - Data serialization/deserialization errors
///
/// Example usage:
/// ```dart
/// // In a data source implementation
/// try {
///   final result = await database.insert(model);
///   return Right(result);
/// } catch (e) {
///   return Left(DataSourceFailure('Database insert failed', e));
/// }
/// ```
class DataSourceFailure extends Failure {
  /// Creates a DataSourceFailure with the given message and optional original error.
  ///
  /// Parameters:
  /// - [message]: Description of the data source error
  /// - [originalError]: Optional original error that caused this data source failure
  const DataSourceFailure(String message, {dynamic originalError})
      : super(message, originalError);

  @override
  String toString() => 'DataSourceFailure: $message';
}

/// Failure for network-related errors.
///
/// This failure type represents errors that occur during network operations,
/// such as HTTP requests, API calls, or connectivity issues. It provides
/// specific handling for network-related problems.
///
/// Common scenarios:
/// - No internet connection
/// - Request timeouts
/// - HTTP error status codes (4xx, 5xx)
/// - SSL/TLS certificate errors
/// - DNS resolution failures
///
/// Example usage:
/// ```dart
/// // In a remote data source
/// try {
///   final response = await httpClient.get(url);
///   return Right(response.data);
/// } catch (e) {
///   return Left(NetworkFailure('Failed to fetch data from server', e));
/// }
/// ```
class NetworkFailure extends Failure {
  /// Creates a NetworkFailure with the given message and optional original error.
  ///
  /// Parameters:
  /// - [message]: Description of the network error
  /// - [originalError]: Optional original error that caused this network failure
  const NetworkFailure(String message, [dynamic originalError])
      : super(message, originalError);

  @override
  String toString() => 'NetworkFailure: $message';
}

/// Failure for caching-related errors.
///
/// This failure type represents errors that occur during cache operations,
/// such as reading from or writing to local storage, memory cache, or
/// other caching mechanisms.
///
/// Common scenarios:
/// - Cache corruption or invalid data
/// - Storage space limitations
/// - Cache expiration handling errors
/// - Serialization errors for cached data
///
/// Example usage:
/// ```dart
/// // In a cache implementation
/// try {
///   final cachedData = await cache.get(key);
///   return Right(cachedData);
/// } catch (e) {
///   return Left(CacheFailure('Failed to retrieve cached data', e));
/// }
/// ```
class CacheFailure extends Failure {
  /// Creates a CacheFailure with the given message and optional original error.
  ///
  /// Parameters:
  /// - [message]: Description of the cache error
  /// - [originalError]: Optional original error that caused this cache failure
  const CacheFailure(String message, [dynamic originalError])
      : super(message, originalError);

  @override
  String toString() => 'CacheFailure: $message';
}

/// Failure for unknown or unexpected errors.
///
/// This failure type serves as a catch-all for errors that don't fit into
/// other specific failure categories or for unexpected exceptions that
/// occur during application execution. It should be used sparingly and
/// ideally replaced with more specific failure types when possible.
///
/// Common scenarios:
/// - Unhandled exceptions in try-catch blocks
/// - Third-party library errors that don't map to specific failure types
/// - System-level errors or platform-specific issues
/// - Temporary fallback for errors during development
///
/// Example usage:
/// ```dart
/// // As a fallback in error handling
/// try {
///   // Some operation
///   return Right(result);
/// } on SpecificException catch (e) {
///   return Left(ValidationFailure('Specific error', e));
/// } catch (e) {
///   return Left(UnknownFailure('An unexpected error occurred', e));
/// }
/// ```
class UnknownFailure extends Failure {
  /// Creates an UnknownFailure with the given message and optional original error.
  ///
  /// Parameters:
  /// - [message]: Description of the unknown error
  /// - [originalError]: Optional original error that caused this unknown failure
  const UnknownFailure(String message, [dynamic originalError])
      : super(message, originalError);

  @override
  String toString() => 'UnknownFailure: $message';
}
