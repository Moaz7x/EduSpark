import 'package:edusparkv4/features/simple_todos/presentation/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Import the data providers file
import 'features/simple_todos/data/providers/simple_todos_data_providers.dart';

// Make main async
Future<void> main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Create a ProviderContainer to initialize the data source
  final container = ProviderContainer();
  
  // Initialize the local data source before running the app.
  // This ensures the database is open and ready when the first provider needs it.
  await container.read(localDataSourceInitProvider.future);

  runApp(
    // We pass the same container to the ProviderScope. This is important
    // so that the state of the initialized provider is not lost.
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),
      ),
      home: const TodoListScreen(),
    );
  }
}
