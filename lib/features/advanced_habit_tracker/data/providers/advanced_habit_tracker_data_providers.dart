import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local_datasource.dart';
import '../datasources/local_datasource_impl.dart';
import '../repositories/repositories.dart';

import '../../domain/usecases/habit/create_habit.dart';
import '../../domain/usecases/habit/get_by_id_habit.dart';
import '../../domain/usecases/habit/get_all_habit.dart';
import '../../domain/usecases/habit/update_habit.dart';
import '../../domain/usecases/habit/delete_habit.dart';
import '../../domain/usecases/habit/search_habit.dart';
import '../../domain/usecases/habit/get_paginated_habit.dart';
import '../../domain/usecases/habit/get_filtered_habit.dart';
import '../../domain/usecases/habit/count_habit.dart';

import '../../domain/usecases/habit_log/create_habit_log.dart';
import '../../domain/usecases/habit_log/get_by_id_habit_log.dart';
import '../../domain/usecases/habit_log/get_all_habit_log.dart';
import '../../domain/usecases/habit_log/update_habit_log.dart';
import '../../domain/usecases/habit_log/delete_habit_log.dart';
import '../../domain/usecases/habit_log/search_habit_log.dart';
import '../../domain/usecases/habit_log/get_paginated_habit_log.dart';
import '../../domain/usecases/habit_log/get_filtered_habit_log.dart';
import '../../domain/usecases/habit_log/count_habit_log.dart';

import '../../domain/usecases/habit_reminder/create_habit_reminder.dart';
import '../../domain/usecases/habit_reminder/get_by_id_habit_reminder.dart';
import '../../domain/usecases/habit_reminder/get_all_habit_reminder.dart';
import '../../domain/usecases/habit_reminder/update_habit_reminder.dart';
import '../../domain/usecases/habit_reminder/delete_habit_reminder.dart';
import '../../domain/usecases/habit_reminder/search_habit_reminder.dart';
import '../../domain/usecases/habit_reminder/get_paginated_habit_reminder.dart';
import '../../domain/usecases/habit_reminder/get_filtered_habit_reminder.dart';
import '../../domain/usecases/habit_reminder/count_habit_reminder.dart';

import '../../domain/usecases/habit_category/create_habit_category.dart';
import '../../domain/usecases/habit_category/get_by_id_habit_category.dart';
import '../../domain/usecases/habit_category/get_all_habit_category.dart';
import '../../domain/usecases/habit_category/update_habit_category.dart';
import '../../domain/usecases/habit_category/delete_habit_category.dart';
import '../../domain/usecases/habit_category/search_habit_category.dart';
import '../../domain/usecases/habit_category/get_paginated_habit_category.dart';
import '../../domain/usecases/habit_category/get_filtered_habit_category.dart';
import '../../domain/usecases/habit_category/count_habit_category.dart';


/// Riverpod providers for AdvancedHabitTracker feature data layer.
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


// ==================== Habit Repository Providers ====================

/// Provider for Habit repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return HabitRepositoryImpl(localDataSource);
});

// ==================== Habit Use Case Providers ====================

/// Provider for CreateHabitUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createHabitUseCaseProvider = Provider<CreateHabitUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return CreateHabitUseCase(repository);
});

/// Provider for GetHabitByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getHabitByIdUseCaseProvider = Provider<GetHabitByIdUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return GetHabitByIdUseCase(repository);
});

/// Provider for GetAllHabitsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllHabitsUseCaseProvider = Provider<GetAllHabitsUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return GetAllHabitsUseCase(repository);
});

/// Provider for UpdateHabitUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateHabitUseCaseProvider = Provider<UpdateHabitUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return UpdateHabitUseCase(repository);
});

/// Provider for DeleteHabitUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteHabitUseCaseProvider = Provider<DeleteHabitUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return DeleteHabitUseCase(repository);
});

/// Provider for SearchHabitsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchHabitsUseCaseProvider = Provider<SearchHabitsUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return SearchHabitsUseCase(repository);
});

/// Provider for GetPaginatedHabitsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedHabitsUseCaseProvider = Provider<GetPaginatedHabitsUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return GetPaginatedHabitsUseCase(repository);
});

/// Provider for GetFilteredHabitsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredHabitsUseCaseProvider = Provider<GetFilteredHabitsUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return GetFilteredHabitsUseCase(repository);
});

/// Provider for CountHabitsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countHabitsUseCaseProvider = Provider<CountHabitsUseCase>((ref) {
  final repository = ref.read(habitRepositoryProvider);
  return CountHabitsUseCase(repository);
});


// ==================== HabitLog Repository Providers ====================

/// Provider for HabitLog repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final habitLogRepositoryProvider = Provider<HabitLogRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return HabitLogRepositoryImpl(localDataSource);
});

// ==================== HabitLog Use Case Providers ====================

/// Provider for CreateHabitLogUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createHabitLogUseCaseProvider = Provider<CreateHabitLogUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return CreateHabitLogUseCase(repository);
});

/// Provider for GetHabitLogByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getHabitLogByIdUseCaseProvider = Provider<GetHabitLogByIdUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return GetHabitLogByIdUseCase(repository);
});

/// Provider for GetAllHabitLogsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllHabitLogsUseCaseProvider = Provider<GetAllHabitLogsUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return GetAllHabitLogsUseCase(repository);
});

/// Provider for UpdateHabitLogUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateHabitLogUseCaseProvider = Provider<UpdateHabitLogUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return UpdateHabitLogUseCase(repository);
});

/// Provider for DeleteHabitLogUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteHabitLogUseCaseProvider = Provider<DeleteHabitLogUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return DeleteHabitLogUseCase(repository);
});

/// Provider for SearchHabitLogsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchHabitLogsUseCaseProvider = Provider<SearchHabitLogsUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return SearchHabitLogsUseCase(repository);
});

/// Provider for GetPaginatedHabitLogsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedHabitLogsUseCaseProvider = Provider<GetPaginatedHabitLogsUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return GetPaginatedHabitLogsUseCase(repository);
});

/// Provider for GetFilteredHabitLogsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredHabitLogsUseCaseProvider = Provider<GetFilteredHabitLogsUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return GetFilteredHabitLogsUseCase(repository);
});

/// Provider for CountHabitLogsUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countHabitLogsUseCaseProvider = Provider<CountHabitLogsUseCase>((ref) {
  final repository = ref.read(habitLogRepositoryProvider);
  return CountHabitLogsUseCase(repository);
});


// ==================== HabitReminder Repository Providers ====================

/// Provider for HabitReminder repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final habitReminderRepositoryProvider = Provider<HabitReminderRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return HabitReminderRepositoryImpl(localDataSource);
});

// ==================== HabitReminder Use Case Providers ====================

/// Provider for CreateHabitReminderUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createHabitReminderUseCaseProvider = Provider<CreateHabitReminderUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return CreateHabitReminderUseCase(repository);
});

/// Provider for GetHabitReminderByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getHabitReminderByIdUseCaseProvider = Provider<GetHabitReminderByIdUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return GetHabitReminderByIdUseCase(repository);
});

/// Provider for GetAllHabitRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllHabitRemindersUseCaseProvider = Provider<GetAllHabitRemindersUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return GetAllHabitRemindersUseCase(repository);
});

/// Provider for UpdateHabitReminderUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateHabitReminderUseCaseProvider = Provider<UpdateHabitReminderUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return UpdateHabitReminderUseCase(repository);
});

/// Provider for DeleteHabitReminderUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteHabitReminderUseCaseProvider = Provider<DeleteHabitReminderUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return DeleteHabitReminderUseCase(repository);
});

/// Provider for SearchHabitRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchHabitRemindersUseCaseProvider = Provider<SearchHabitRemindersUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return SearchHabitRemindersUseCase(repository);
});

/// Provider for GetPaginatedHabitRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedHabitRemindersUseCaseProvider = Provider<GetPaginatedHabitRemindersUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return GetPaginatedHabitRemindersUseCase(repository);
});

/// Provider for GetFilteredHabitRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredHabitRemindersUseCaseProvider = Provider<GetFilteredHabitRemindersUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return GetFilteredHabitRemindersUseCase(repository);
});

/// Provider for CountHabitRemindersUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countHabitRemindersUseCaseProvider = Provider<CountHabitRemindersUseCase>((ref) {
  final repository = ref.read(habitReminderRepositoryProvider);
  return CountHabitRemindersUseCase(repository);
});


// ==================== HabitCategory Repository Providers ====================

/// Provider for HabitCategory repository implementation.
///
/// This provider creates the repository implementation with proper
/// dependency injection of the local data source.
final habitCategoryRepositoryProvider = Provider<HabitCategoryRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return HabitCategoryRepositoryImpl(localDataSource);
});

// ==================== HabitCategory Use Case Providers ====================

/// Provider for CreateHabitCategoryUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final createHabitCategoryUseCaseProvider = Provider<CreateHabitCategoryUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return CreateHabitCategoryUseCase(repository);
});

/// Provider for GetHabitCategoryByIdUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getHabitCategoryByIdUseCaseProvider = Provider<GetHabitCategoryByIdUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return GetHabitCategoryByIdUseCase(repository);
});

/// Provider for GetAllHabitCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getAllHabitCategorysUseCaseProvider = Provider<GetAllHabitCategorysUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return GetAllHabitCategorysUseCase(repository);
});

/// Provider for UpdateHabitCategoryUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final updateHabitCategoryUseCaseProvider = Provider<UpdateHabitCategoryUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return UpdateHabitCategoryUseCase(repository);
});

/// Provider for DeleteHabitCategoryUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final deleteHabitCategoryUseCaseProvider = Provider<DeleteHabitCategoryUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return DeleteHabitCategoryUseCase(repository);
});

/// Provider for SearchHabitCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final searchHabitCategorysUseCaseProvider = Provider<SearchHabitCategorysUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return SearchHabitCategorysUseCase(repository);
});

/// Provider for GetPaginatedHabitCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getPaginatedHabitCategorysUseCaseProvider = Provider<GetPaginatedHabitCategorysUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return GetPaginatedHabitCategorysUseCase(repository);
});

/// Provider for GetFilteredHabitCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final getFilteredHabitCategorysUseCaseProvider = Provider<GetFilteredHabitCategorysUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return GetFilteredHabitCategorysUseCase(repository);
});

/// Provider for CountHabitCategorysUseCase.
///
/// This provider creates the use case with proper dependency injection
/// of the repository.
final countHabitCategorysUseCaseProvider = Provider<CountHabitCategorysUseCase>((ref) {
  final repository = ref.read(habitCategoryRepositoryProvider);
  return CountHabitCategorysUseCase(repository);
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

    'habit',

    'habit_log',

    'habit_reminder',

    'habit_category',

  ];
});
