import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class TelegramLoginParams extends Equatable {
  final String authorizationToken;

  const TelegramLoginParams({required this.authorizationToken});

  @override
  List<Object?> get props => [authorizationToken];
}

class TelegramLoginUsecase {
  final AuthRepository repository;

  TelegramLoginUsecase(this.repository);

  Future<Either<Failure, User>> call(TelegramLoginParams params) async {
    try {
      final user = await repository.loginWithTelegram(params.authorizationToken);
      return Right(user);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
