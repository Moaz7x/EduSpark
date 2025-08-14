import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local_datasource.dart';
import '../datasources/local_datasource_impl.dart';
import '../repositories/repositories.dart';

import '../../domain/usecases/todo/create_todo.dart';
import '../../domain/usecases/todo/get_by_id_todo.dart';
import '../../domain/usecases/todo/get_all_todo.dart';
import '../../domain/usecases/todo/update_todo.dart';
import '../../domain/usecases/todo/delete_todo.dart';
import '../../domain/usecases/todo/search_todo.dart';
import '../../domain/usecases/todo/get_paginated_todo.dart';
import '../../domain/usecases/todo/get_filtered_todo.dart';
import '../../domain/usecases/todo/count_todo.dart';

import '../../domain/usecases/subtask/create_subtask.dart';
import '../../domain/usecases/subtask/get_by_id_subtask.dart';
import '../../domain/usecases/subtask/get_all_subtask.dart';
import '../../domain/usecases/subtask/update_subtask.dart';
import '../../domain/usecases/subtask/delete_subtask.dart';
import '../../domain/usecases/subtask/search_subtask.dart';
import '../../domain/usecases/subtask/get_paginated_subtask.dart';
import '../../domain/usecases/subtask/get_filtered_subtask.dart';
import '../../domain/usecases/subtask/count_subtask.dart';

import '../../domain/usecases/reminder/create_reminder.dart';
import '../../domain/usecases/reminder/get_by_id_reminder.dart';
import '../../domain/usecases/reminder/get_all_reminder.dart';
import '../../domain/usecases/reminder/update_reminder.dart';
import '../../domain/usecases/reminder/delete_reminder.dart';
import '../../domain/usecases/reminder/search_reminder.dart';
import '../../domain/usecases/reminder/get_paginated_reminder.dart';
import '../../domain/usecases/reminder/get_filtered_reminder.dart';
import '../../domain/usecases/reminder/count_reminder.dart';


/// Riverpod providers for SimpleTodos feature data layer.
///
/// This file contains all the providers needed for dependency injection
/// in the data layer, supporting multiple entities and clean architecture.

// ==================== Core Data Source Providers ====================

/// Provider for the local data source implementation.
///
/// This provider creates and initializes the LocalDataSource instance
/// that will be used throughout the application for local data persistence.
final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  final dataSource = LocalDataSourceImpl();

  // Initialize the data source when first accessed
  ref.onDispose(() {
    dataSource.close();
  });

  return dataSource;
});

/// Provider for initializing the local data source.
///
/// This provider ensures the data source is properly initialized
/// before being used by other providers.
final localDataSourceInitProvider = FutureProvider<void>((ref) async {
  final dataSource = ref.read(localDataSourceProvider);
  await dataSource.initialize();
});


// ==================== Todo Repository Providers ====================

/// Provider for Todo repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return TodoRepositoryImpl(localDataSource);
});

// ==================== Todo Use Case Providers ====================

/// Provider for CreateTodoUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createTodoUseCaseProvider = Provider<CreateTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return CreateTodoUseCase(repository);
});

/// Provider for GetTodoByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getTodoByIdUseCaseProvider = Provider<GetTodoByIdUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return GetTodoByIdUseCase(repository);
});

/// Provider for GetAllTodosUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllTodosUseCaseProvider = Provider<GetAllTodosUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return GetAllTodosUseCase(repository);
});

/// Provider for UpdateTodoUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateTodoUseCaseProvider = Provider<UpdateTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return UpdateTodoUseCase(repository);
});

/// Provider for DeleteTodoUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteTodoUseCaseProvider = Provider<DeleteTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return DeleteTodoUseCase(repository);
});

/// Provider for SearchTodosUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchTodosUseCaseProvider = Provider<SearchTodosUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return SearchTodosUseCase(repository);
});

/// Provider for GetPaginatedTodosUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedTodosUseCaseProvider = Provider<GetPaginatedTodosUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return GetPaginatedTodosUseCase(repository);
});

/// Provider for GetFilteredTodosUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredTodosUseCaseProvider = Provider<GetFilteredTodosUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return GetFilteredTodosUseCase(repository);
});

/// Provider for CountTodosUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countTodosUseCaseProvider = Provider<CountTodosUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return CountTodosUseCase(repository);
});


// ==================== Subtask Repository Providers ====================

/// Provider for Subtask repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final subtaskRepositoryProvider = Provider<SubtaskRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return SubtaskRepositoryImpl(localDataSource);
});

// ==================== Subtask Use Case Providers ====================

/// Provider for CreateSubtaskUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createSubtaskUseCaseProvider = Provider<CreateSubtaskUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return CreateSubtaskUseCase(repository);
});

/// Provider for GetSubtaskByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getSubtaskByIdUseCaseProvider = Provider<GetSubtaskByIdUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return GetSubtaskByIdUseCase(repository);
});

/// Provider for GetAllSubtasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllSubtasksUseCaseProvider = Provider<GetAllSubtasksUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return GetAllSubtasksUseCase(repository);
});

/// Provider for UpdateSubtaskUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateSubtaskUseCaseProvider = Provider<UpdateSubtaskUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return UpdateSubtaskUseCase(repository);
});

/// Provider for DeleteSubtaskUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteSubtaskUseCaseProvider = Provider<DeleteSubtaskUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return DeleteSubtaskUseCase(repository);
});

/// Provider for SearchSubtasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchSubtasksUseCaseProvider = Provider<SearchSubtasksUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return SearchSubtasksUseCase(repository);
});

/// Provider for GetPaginatedSubtasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedSubtasksUseCaseProvider = Provider<GetPaginatedSubtasksUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return GetPaginatedSubtasksUseCase(repository);
});

/// Provider for GetFilteredSubtasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredSubtasksUseCaseProvider = Provider<GetFilteredSubtasksUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return GetFilteredSubtasksUseCase(repository);
});

/// Provider for CountSubtasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countSubtasksUseCaseProvider = Provider<CountSubtasksUseCase>((ref) {
  final repository = ref.read(subtaskRepositoryProvider);
  return CountSubtasksUseCase(repository);
});


// ==================== Reminder Repository Providers ====================

/// Provider for Reminder repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return ReminderRepositoryImpl(localDataSource);
});

// ==================== Reminder Use Case Providers ====================

/// Provider for CreateReminderUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createReminderUseCaseProvider = Provider<CreateReminderUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return CreateReminderUseCase(repository);
});

/// Provider for GetReminderByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getReminderByIdUseCaseProvider = Provider<GetReminderByIdUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return GetReminderByIdUseCase(repository);
});

/// Provider for GetAllRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllRemindersUseCaseProvider = Provider<GetAllRemindersUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return GetAllRemindersUseCase(repository);
});

/// Provider for UpdateReminderUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateReminderUseCaseProvider = Provider<UpdateReminderUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return UpdateReminderUseCase(repository);
});

/// Provider for DeleteReminderUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteReminderUseCaseProvider = Provider<DeleteReminderUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return DeleteReminderUseCase(repository);
});

/// Provider for SearchRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchRemindersUseCaseProvider = Provider<SearchRemindersUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return SearchRemindersUseCase(repository);
});

/// Provider for GetPaginatedRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedRemindersUseCaseProvider = Provider<GetPaginatedRemindersUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return GetPaginatedRemindersUseCase(repository);
});

/// Provider for GetFilteredRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredRemindersUseCaseProvider = Provider<GetFilteredRemindersUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return GetFilteredRemindersUseCase(repository);
});

/// Provider for CountRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countRemindersUseCaseProvider = Provider<CountRemindersUseCase>((ref) {
  final repository = ref.read(reminderRepositoryProvider);
  return CountRemindersUseCase(repository);
});



// ==================== Utility Providers ====================

/// Provider for checking if the data source is initialized.
///
/// This provider can be used to ensure the data source is ready
/// before performing operations.
final isDataSourceInitializedProvider = FutureProvider<bool>((ref) async {
  try {
    await ref.read(localDataSourceInitProvider.future);
    return true;
  } catch (e) {
    return false;
  }
});

/// Provider for getting all available entity types.
///
/// This provider returns a list of all entity types supported
/// by the current feature.
final availableEntityTypesProvider = Provider<List<String>>((ref) {
  return [

    'todo',

    'subtask',

    'reminder',

  ];
});
