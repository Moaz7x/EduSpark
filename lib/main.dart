import 'package:edusparkv4/features/simple_todos/presentation/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './features/simple_todos/data/providers/simple_todos_data_providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //return const TestFix4MainPage();
    ref.watch(localDataSourceProvider).initialize();
    return const MaterialApp(
      home: TodoListScreen(),
      );
  }
}
