import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/badge.dart';
import 'package:my_badge/domain/repositories/badge_repository.dart';

class GetBadgeCategoriesUsecase {
  final BadgeRepository repository;

  GetBadgeCategoriesUsecase(this.repository);

  Future<Either<Failure, List<BadgeCategory>>> call() async {
    try {
      final categories = await repository.getBadgeCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
