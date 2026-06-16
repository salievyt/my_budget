import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  Future<Either<Failure, void>> call() async {
    try {
      await repository.logout();
      return Right(null);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
