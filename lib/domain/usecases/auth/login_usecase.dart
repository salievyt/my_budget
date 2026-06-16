import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, User>> call(LoginParams params) async {
    try {
      final user = await repository.login(params.email, params.password);
      return Right(user);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
