import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local_datasource.dart';
import '../datasources/local_datasource_impl.dart';
import '../repositories/repositories.dart';

import '../../domain/usecases/category/create_category.dart';
import '../../domain/usecases/category/get_by_id_category.dart';
import '../../domain/usecases/category/get_all_category.dart';
import '../../domain/usecases/category/update_category.dart';
import '../../domain/usecases/category/delete_category.dart';
import '../../domain/usecases/category/search_category.dart';
import '../../domain/usecases/category/get_paginated_category.dart';
import '../../domain/usecases/category/get_filtered_category.dart';
import '../../domain/usecases/category/count_category.dart';

import '../../domain/usecases/task/create_task.dart';
import '../../domain/usecases/task/get_by_id_task.dart';
import '../../domain/usecases/task/get_all_task.dart';
import '../../domain/usecases/task/update_task.dart';
import '../../domain/usecases/task/delete_task.dart';
import '../../domain/usecases/task/search_task.dart';
import '../../domain/usecases/task/get_paginated_task.dart';
import '../../domain/usecases/task/get_filtered_task.dart';
import '../../domain/usecases/task/count_task.dart';

import '../../domain/usecases/pomodoro_session/create_pomodoro_session.dart';
import '../../domain/usecases/pomodoro_session/get_by_id_pomodoro_session.dart';
import '../../domain/usecases/pomodoro_session/get_all_pomodoro_session.dart';
import '../../domain/usecases/pomodoro_session/update_pomodoro_session.dart';
import '../../domain/usecases/pomodoro_session/delete_pomodoro_session.dart';
import '../../domain/usecases/pomodoro_session/search_pomodoro_session.dart';
import '../../domain/usecases/pomodoro_session/get_paginated_pomodoro_session.dart';
import '../../domain/usecases/pomodoro_session/get_filtered_pomodoro_session.dart';
import '../../domain/usecases/pomodoro_session/count_pomodoro_session.dart';

import '../../domain/usecases/break_session/create_break_session.dart';
import '../../domain/usecases/break_session/get_by_id_break_session.dart';
import '../../domain/usecases/break_session/get_all_break_session.dart';
import '../../domain/usecases/break_session/update_break_session.dart';
import '../../domain/usecases/break_session/delete_break_session.dart';
import '../../domain/usecases/break_session/search_break_session.dart';
import '../../domain/usecases/break_session/get_paginated_break_session.dart';
import '../../domain/usecases/break_session/get_filtered_break_session.dart';
import '../../domain/usecases/break_session/count_break_session.dart';

import '../../domain/usecases/statistics/create_statistics.dart';
import '../../domain/usecases/statistics/get_by_id_statistics.dart';
import '../../domain/usecases/statistics/get_all_statistics.dart';
import '../../domain/usecases/statistics/update_statistics.dart';
import '../../domain/usecases/statistics/delete_statistics.dart';
import '../../domain/usecases/statistics/search_statistics.dart';
import '../../domain/usecases/statistics/get_paginated_statistics.dart';
import '../../domain/usecases/statistics/get_filtered_statistics.dart';
import '../../domain/usecases/statistics/count_statistics.dart';


/// Riverpod providers for AdvancedPomodoro feature data layer.
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


// ==================== Category Repository Providers ====================

/// Provider for Category repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return CategoryRepositoryImpl(localDataSource);
});

// ==================== Category Use Case Providers ====================

/// Provider for CreateCategoryUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createCategoryUseCaseProvider = Provider<CreateCategoryUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return CreateCategoryUseCase(repository);
});

/// Provider for GetCategoryByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getCategoryByIdUseCaseProvider = Provider<GetCategoryByIdUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return GetCategoryByIdUseCase(repository);
});

/// Provider for GetAllCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllCategorysUseCaseProvider = Provider<GetAllCategorysUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return GetAllCategorysUseCase(repository);
});

/// Provider for UpdateCategoryUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateCategoryUseCaseProvider = Provider<UpdateCategoryUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return UpdateCategoryUseCase(repository);
});

/// Provider for DeleteCategoryUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteCategoryUseCaseProvider = Provider<DeleteCategoryUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return DeleteCategoryUseCase(repository);
});

/// Provider for SearchCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchCategorysUseCaseProvider = Provider<SearchCategorysUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return SearchCategorysUseCase(repository);
});

/// Provider for GetPaginatedCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedCategorysUseCaseProvider = Provider<GetPaginatedCategorysUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return GetPaginatedCategorysUseCase(repository);
});

/// Provider for GetFilteredCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredCategorysUseCaseProvider = Provider<GetFilteredCategorysUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return GetFilteredCategorysUseCase(repository);
});

/// Provider for CountCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countCategorysUseCaseProvider = Provider<CountCategorysUseCase>((ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return CountCategorysUseCase(repository);
});


// ==================== Task Repository Providers ====================

/// Provider for Task repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return TaskRepositoryImpl(localDataSource);
});

// ==================== Task Use Case Providers ====================

/// Provider for CreateTaskUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createTaskUseCaseProvider = Provider<CreateTaskUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return CreateTaskUseCase(repository);
});

/// Provider for GetTaskByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getTaskByIdUseCaseProvider = Provider<GetTaskByIdUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return GetTaskByIdUseCase(repository);
});

/// Provider for GetAllTasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllTasksUseCaseProvider = Provider<GetAllTasksUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return GetAllTasksUseCase(repository);
});

/// Provider for UpdateTaskUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateTaskUseCaseProvider = Provider<UpdateTaskUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return UpdateTaskUseCase(repository);
});

/// Provider for DeleteTaskUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteTaskUseCaseProvider = Provider<DeleteTaskUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return DeleteTaskUseCase(repository);
});

/// Provider for SearchTasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchTasksUseCaseProvider = Provider<SearchTasksUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return SearchTasksUseCase(repository);
});

/// Provider for GetPaginatedTasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedTasksUseCaseProvider = Provider<GetPaginatedTasksUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return GetPaginatedTasksUseCase(repository);
});

/// Provider for GetFilteredTasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredTasksUseCaseProvider = Provider<GetFilteredTasksUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return GetFilteredTasksUseCase(repository);
});

/// Provider for CountTasksUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countTasksUseCaseProvider = Provider<CountTasksUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return CountTasksUseCase(repository);
});


// ==================== PomodoroSession Repository Providers ====================

/// Provider for PomodoroSession repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final pomodoroSessionRepositoryProvider = Provider<PomodoroSessionRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return PomodoroSessionRepositoryImpl(localDataSource);
});

// ==================== PomodoroSession Use Case Providers ====================

/// Provider for CreatePomodoroSessionUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createPomodoroSessionUseCaseProvider = Provider<CreatePomodoroSessionUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return CreatePomodoroSessionUseCase(repository);
});

/// Provider for GetPomodoroSessionByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPomodoroSessionByIdUseCaseProvider = Provider<GetPomodoroSessionByIdUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return GetPomodoroSessionByIdUseCase(repository);
});

/// Provider for GetAllPomodoroSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllPomodoroSessionsUseCaseProvider = Provider<GetAllPomodoroSessionsUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return GetAllPomodoroSessionsUseCase(repository);
});

/// Provider for UpdatePomodoroSessionUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updatePomodoroSessionUseCaseProvider = Provider<UpdatePomodoroSessionUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return UpdatePomodoroSessionUseCase(repository);
});

/// Provider for DeletePomodoroSessionUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deletePomodoroSessionUseCaseProvider = Provider<DeletePomodoroSessionUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return DeletePomodoroSessionUseCase(repository);
});

/// Provider for SearchPomodoroSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchPomodoroSessionsUseCaseProvider = Provider<SearchPomodoroSessionsUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return SearchPomodoroSessionsUseCase(repository);
});

/// Provider for GetPaginatedPomodoroSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedPomodoroSessionsUseCaseProvider = Provider<GetPaginatedPomodoroSessionsUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return GetPaginatedPomodoroSessionsUseCase(repository);
});

/// Provider for GetFilteredPomodoroSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredPomodoroSessionsUseCaseProvider = Provider<GetFilteredPomodoroSessionsUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return GetFilteredPomodoroSessionsUseCase(repository);
});

/// Provider for CountPomodoroSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countPomodoroSessionsUseCaseProvider = Provider<CountPomodoroSessionsUseCase>((ref) {
  final repository = ref.read(pomodoroSessionRepositoryProvider);
  return CountPomodoroSessionsUseCase(repository);
});


// ==================== BreakSession Repository Providers ====================

/// Provider for BreakSession repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final breakSessionRepositoryProvider = Provider<BreakSessionRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return BreakSessionRepositoryImpl(localDataSource);
});

// ==================== BreakSession Use Case Providers ====================

/// Provider for CreateBreakSessionUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createBreakSessionUseCaseProvider = Provider<CreateBreakSessionUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return CreateBreakSessionUseCase(repository);
});

/// Provider for GetBreakSessionByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getBreakSessionByIdUseCaseProvider = Provider<GetBreakSessionByIdUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return GetBreakSessionByIdUseCase(repository);
});

/// Provider for GetAllBreakSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllBreakSessionsUseCaseProvider = Provider<GetAllBreakSessionsUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return GetAllBreakSessionsUseCase(repository);
});

/// Provider for UpdateBreakSessionUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateBreakSessionUseCaseProvider = Provider<UpdateBreakSessionUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return UpdateBreakSessionUseCase(repository);
});

/// Provider for DeleteBreakSessionUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteBreakSessionUseCaseProvider = Provider<DeleteBreakSessionUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return DeleteBreakSessionUseCase(repository);
});

/// Provider for SearchBreakSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchBreakSessionsUseCaseProvider = Provider<SearchBreakSessionsUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return SearchBreakSessionsUseCase(repository);
});

/// Provider for GetPaginatedBreakSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedBreakSessionsUseCaseProvider = Provider<GetPaginatedBreakSessionsUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return GetPaginatedBreakSessionsUseCase(repository);
});

/// Provider for GetFilteredBreakSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredBreakSessionsUseCaseProvider = Provider<GetFilteredBreakSessionsUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return GetFilteredBreakSessionsUseCase(repository);
});

/// Provider for CountBreakSessionsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countBreakSessionsUseCaseProvider = Provider<CountBreakSessionsUseCase>((ref) {
  final repository = ref.read(breakSessionRepositoryProvider);
  return CountBreakSessionsUseCase(repository);
});


// ==================== Statistics Repository Providers ====================

/// Provider for Statistics repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final statisticsRepositoryProvider = Provider<StatisticsRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return StatisticsRepositoryImpl(localDataSource);
});

// ==================== Statistics Use Case Providers ====================

/// Provider for CreateStatisticsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createStatisticsUseCaseProvider = Provider<CreateStatisticsUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return CreateStatisticsUseCase(repository);
});

/// Provider for GetStatisticsByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getStatisticsByIdUseCaseProvider = Provider<GetStatisticsByIdUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return GetStatisticsByIdUseCase(repository);
});

/// Provider for GetAllStatisticssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllStatisticssUseCaseProvider = Provider<GetAllStatisticssUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return GetAllStatisticssUseCase(repository);
});

/// Provider for UpdateStatisticsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateStatisticsUseCaseProvider = Provider<UpdateStatisticsUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return UpdateStatisticsUseCase(repository);
});

/// Provider for DeleteStatisticsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteStatisticsUseCaseProvider = Provider<DeleteStatisticsUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return DeleteStatisticsUseCase(repository);
});

/// Provider for SearchStatisticssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchStatisticssUseCaseProvider = Provider<SearchStatisticssUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return SearchStatisticssUseCase(repository);
});

/// Provider for GetPaginatedStatisticssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedStatisticssUseCaseProvider = Provider<GetPaginatedStatisticssUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return GetPaginatedStatisticssUseCase(repository);
});

/// Provider for GetFilteredStatisticssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredStatisticssUseCaseProvider = Provider<GetFilteredStatisticssUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return GetFilteredStatisticssUseCase(repository);
});

/// Provider for CountStatisticssUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countStatisticssUseCaseProvider = Provider<CountStatisticssUseCase>((ref) {
  final repository = ref.read(statisticsRepositoryProvider);
  return CountStatisticssUseCase(repository);
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

    'category',

    'task',

    'pomodoro_session',

    'break_session',

    'statistics',

  ];
});
