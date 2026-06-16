import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String? nickname;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.nickname,
  });

  @override
  List<Object?> get props => [email, password, firstName, lastName, nickname];
}

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<Failure, User>> call(RegisterParams params) async {
    try {
      final user = await repository.register(
        email: params.email,
        password: params.password,
        firstName: params.firstName,
        lastName: params.lastName,
        nickname: params.nickname,
      );
      return Right(user);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
