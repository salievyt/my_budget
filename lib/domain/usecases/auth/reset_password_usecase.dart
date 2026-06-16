import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  final String email;

  const ResetPasswordParams({required this.email});

  @override
  List<Object?> get props => [email];
}

class ResetPasswordUsecase {
  final AuthRepository repository;

  ResetPasswordUsecase(this.repository);

  Future<Either<Failure, void>> call(ResetPasswordParams params) async {
    try {
      await repository.resetPassword(params.email);
      return Right(null);
    } catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    }
  }
}
