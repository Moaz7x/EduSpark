/// Core types for functional programming and error handling.
///
/// This barrel file exports all the core types used throughout the application
/// for functional programming patterns, particularly the Either type for
/// error handling and the Failure hierarchy for representing different
/// categories of errors.
///
/// These types replace traditional exception-based error handling with a
/// more predictable and composable functional approach that integrates
/// seamlessly with Clean Architecture principles.
library;

// Export Either type for functional error handling
export 'either.dart';

// Export Failure hierarchy for type-safe error representation
export 'failures.dart';
