/// Functional programming Either type for error handling in Clean Architecture.
///
/// This file provides a type-safe way to handle operations that can either
/// succeed or fail, replacing traditional exception-based error handling
/// with a more predictable and composable approach.
///
/// The Either type is used throughout the domain and data layers to represent
/// operations that can result in either a failure (Left) or success (Right).
library;

/// Abstract base class representing a value that can be either Left (failure) or Right (success).
///
/// Either is a fundamental type in functional programming used for error handling.
/// It forces explicit handling of both success and failure cases, making code
/// more predictable and less prone to runtime errors.
///
/// Type parameters:
/// - [L]: The type of the Left value (typically a Failure)
/// - [R]: The type of the Right value (typically the success result)
///
/// Example usage:
/// ```dart
/// Future<Either<Failure, User>> getUser(int id) async {
///   try {
///     final user = await userRepository.findById(id);
///     return Right(user);
///   } catch (e) {
///     return Left(RepositoryFailure('Failed to get user: ${e.toString()}'));
///   }
/// }
///
/// // Usage in UI layer
/// final result = await getUser(123);
/// result.fold(
///   (failure) => showError(failure.message),
///   (user) => displayUser(user),
/// );
/// ```
abstract class Either<L, R> {
  /// Creates a const Either instance.
  const Either();

  /// Transforms this Either into a single value by applying one of two functions.
  ///
  /// This is the primary way to extract values from an Either. The [onLeft]
  /// function is called if this is a Left value, and [onRight] is called if
  /// this is a Right value.
  ///
  /// Parameters:
  /// - [onLeft]: Function to apply if this is a Left value
  /// - [onRight]: Function to apply if this is a Right value
  ///
  /// Returns the result of applying the appropriate function.
  ///
  /// Example:
  /// ```dart
  /// final result = either.fold(
  ///   (failure) => 'Error: ${failure.message}',
  ///   (success) => 'Success: $success',
  /// );
  /// ```
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight);

  /// Returns true if this Either contains a Left value (failure).
  ///
  /// This getter allows for type checking without extracting the value.
  /// Useful for conditional logic based on success/failure state.
  ///
  /// Example:
  /// ```dart
  /// if (result.isLeft) {
  ///   print('Operation failed');
  /// }
  /// ```
  bool get isLeft;

  /// Returns true if this Either contains a Right value (success).
  ///
  /// This getter allows for type checking without extracting the value.
  /// Useful for conditional logic based on success/failure state.
  ///
  /// Example:
  /// ```dart
  /// if (result.isRight) {
  ///   print('Operation succeeded');
  /// }
  /// ```
  bool get isRight;

  /// Returns the Left value if this is a Left, otherwise returns null.
  ///
  /// This is a convenience method for extracting Left values when you
  /// know the Either might be a Left and want to handle it safely.
  ///
  /// Example:
  /// ```dart
  /// final failure = result.leftOrNull;
  /// if (failure != null) {
  ///   handleError(failure);
  /// }
  /// ```
  L? get leftOrNull => fold((left) => left, (right) => null);

  /// Returns the Right value if this is a Right, otherwise returns null.
  ///
  /// This is a convenience method for extracting Right values when you
  /// know the Either might be a Right and want to handle it safely.
  ///
  /// Example:
  /// ```dart
  /// final success = result.rightOrNull;
  /// if (success != null) {
  ///   processSuccess(success);
  /// }
  /// ```
  R? get rightOrNull => fold((left) => null, (right) => right);
}

/// Represents the Left side of an Either, typically used for failure cases.
///
/// Left values conventionally represent errors, failures, or exceptional cases
/// in functional programming. This class is immutable and provides a type-safe
/// way to represent failure states.
///
/// Type parameters:
/// - [L]: The type of the Left value (typically a Failure)
/// - [R]: The type of the Right value (for type compatibility)
///
/// Example:
/// ```dart
/// Either<Failure, String> result = Left(ValidationFailure('Invalid input'));
/// ```
class Left<L, R> extends Either<L, R> {
  /// The Left value contained in this Either.
  ///
  /// This value typically represents an error, failure, or exceptional case.
  final L value;

  /// Creates a Left Either with the given value.
  ///
  /// The constructor is const, ensuring immutability and compile-time
  /// optimization when possible.
  ///
  /// Parameters:
  /// - [value]: The Left value to wrap
  const Left(this.value);

  @override
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    return onLeft(value);
  }

  @override
  bool get isLeft => true;

  @override
  bool get isRight => false;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Left<L, R> && other.value == value);
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Left($value)';
}

/// Represents the Right side of an Either, typically used for success cases.
///
/// Right values conventionally represent successful results or normal cases
/// in functional programming. This class is immutable and provides a type-safe
/// way to represent success states.
///
/// Type parameters:
/// - [L]: The type of the Left value (for type compatibility)
/// - [R]: The type of the Right value (typically the success result)
///
/// Example:
/// ```dart
/// Either<Failure, String> result = Right('Operation completed successfully');
/// ```
class Right<L, R> extends Either<L, R> {
  /// The Right value contained in this Either.
  ///
  /// This value typically represents a successful result or normal case.
  final R value;

  /// Creates a Right Either with the given value.
  ///
  /// The constructor is const, ensuring immutability and compile-time
  /// optimization when possible.
  ///
  /// Parameters:
  /// - [value]: The Right value to wrap
  const Right(this.value);

  @override
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    return onRight(value);
  }

  @override
  bool get isLeft => false;

  @override
  bool get isRight => true;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Right<L, R> && other.value == value);
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Right($value)';
}
