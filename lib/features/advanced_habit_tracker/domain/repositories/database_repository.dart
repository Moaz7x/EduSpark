/// Repository interface for database operations.
///
/// This repository defines the contract for database initialization,
/// connection management, and cleanup operations.
abstract class DatabaseRepository {
  /// Initializes the database with all necessary schemas and connections.
  ///
  /// This method should be called once during application startup
  /// to ensure the database is properly configured and ready for use.
  ///
  /// Throws [DatabaseException] if initialization fails.
  Future<void> initialize();

  /// Closes all database connections and cleans up resources.
  ///
  /// This method should be called during application shutdown
  /// to ensure proper cleanup of database resources.
  ///
  /// Throws [DatabaseException] if cleanup fails.
  Future<void> close();

  /// Checks if the database is properly initialized and ready for use.
  ///
  /// Returns `true` if the database is initialized and ready,
  /// `false` otherwise.
  bool get isInitialized;

  /// Gets the current database status information.
  ///
  /// Returns a map containing database status details such as
  /// connection state, schema version, and other relevant information.
  Map<String, dynamic> get status;
}

/// Exception thrown when database operations fail.
class DatabaseException implements Exception {
  final String message;
  final dynamic originalError;

  const DatabaseException(this.message, [this.originalError]);

  @override
  String toString() => 'DatabaseException: $message';
}

