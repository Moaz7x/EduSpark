import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../repositories/database_repository.dart';
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for initializing the database.
///
/// This use case handles the initialization of the local database,
/// ensuring all necessary schemas and connections are properly set up
/// before the application starts using the database.
/// Returns Either&lt;Failure, void&gt; for functional error handling.
class InitializeDatabaseUseCase extends NoParamsUseCase<void> {
  final DatabaseRepository repository;

  InitializeDatabaseUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    try {
      await repository.initialize();
      return const Right(null);
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure('Failed to initialize database: ${e.message}', e));
    } catch (e) {
      return Left(DataSourceFailure('Database initialization failed: ${e.toString()}',originalError: e));
    }
  }
}

