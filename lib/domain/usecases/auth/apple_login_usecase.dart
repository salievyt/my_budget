import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/auth_repository.dart';

class AppleLoginUsecase {
  final AuthRepository repository;

  AppleLoginUsecase(this.repository);

  Future<Either<Failure, User>> call() async {
    try {
      final user = await repository.loginWithApple();
      return Right(user);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
