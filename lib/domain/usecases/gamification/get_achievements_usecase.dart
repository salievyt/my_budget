import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/achievement.dart';
import 'package:my_badge/domain/repositories/user_repository.dart';

class GetAchievementsUsecase {
  final UserRepository repository;

  GetAchievementsUsecase(this.repository);

  Future<Either<Failure, List<Achievement>>> call() async {
    try {
      return Right([]);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
