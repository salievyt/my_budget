import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/user_repository.dart';

class UpdateProfileUsecase {
  final UserRepository repository;

  UpdateProfileUsecase(this.repository);

  Future<Either<Failure, User>> call(User profile) async {
    try {
      final updated = await repository.updateProfile(profile);
      return Right(updated);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
