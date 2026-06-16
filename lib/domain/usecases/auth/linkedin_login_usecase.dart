import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LinkedInLoginParams extends Equatable {
  final String code;
  final String redirectUri;

  const LinkedInLoginParams({
    required this.code,
    required this.redirectUri,
  });

  @override
  List<Object?> get props => [code, redirectUri];
}

class LinkedInLoginUsecase {
  final AuthRepository repository;

  LinkedInLoginUsecase(this.repository);

  Future<Either<Failure, User>> call(LinkedInLoginParams params) async {
    try {
      final user = await repository.loginWithLinkedIn(
        code: params.code,
        redirectUri: params.redirectUri,
      );
      return Right(user);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
