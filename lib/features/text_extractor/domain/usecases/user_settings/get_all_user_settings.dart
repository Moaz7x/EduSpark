import '../../entities/user_settings_entity.dart';
import '../../repositories/user_settings_repository.dart';
import '../base_usecase.dart'; // Includes Either<L,R> and Failure types
import '../../../../../core/exceptions/exceptions.dart'; // Core exceptions
import '../../../../../core/types/types.dart'; // Either, Failure types, and all failure classes

/// Use case for retrieving all UserSettings entities.
///
/// This use case handles the business logic for fetching all available
/// UserSettings entities from the repository.
/// Returns Either&lt;Failure, List&lt;UserSettingsEntity&gt;&gt; for functional error handling.
class GetAllUserSettingssUseCase extends NoParamsUseCase<List<UserSettingsEntity>> {
  final UserSettingsRepository repository;

  GetAllUserSettingssUseCase(this.repository);

  @override
  Future<Either<Failure, List<UserSettingsEntity>>> call() async {
    try {
      final result = await repository.getAll();
      return result;
    } on RepositoryException catch (e) {
      return Left(RepositoryFailure(e.message, e));
    } catch (e) {
      return Left(UnknownFailure('Failed to get all UserSettingss: ${e.toString()}', e));
    }
  }
}

