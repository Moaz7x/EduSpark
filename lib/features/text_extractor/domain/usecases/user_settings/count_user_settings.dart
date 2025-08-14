import '../../repositories/user_settings_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for counting UserSettings entities.
///
/// This use case handles the business logic for getting the total
/// count of UserSettings entities in the system.
/// Returns Either&lt;Failure, int&gt; for functional error handling.
class CountUserSettingssUseCase extends NoParamsUseCase<int> {
  final UserSettingsRepository repository;

  CountUserSettingssUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call() async {
    try {
      final result = await repository.count();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to count UserSettingss: ${e.toString()}', e));
    }
  }
}

