import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/badge.dart';
import 'package:my_badge/domain/repositories/badge_repository.dart';
import 'package:equatable/equatable.dart';

class GetBadgesParams extends Equatable {
  final String? userId;
  final BadgeCategory? category;
  final Rarity? rarity;

  const GetBadgesParams({this.userId, this.category, this.rarity});

  @override
  List<Object?> get props => [userId, category, rarity];
}

class GetBadgesUsecase {
  final BadgeRepository repository;

  GetBadgesUsecase(this.repository);

  Future<Either<Failure, List<Badge>>> call(GetBadgesParams params) async {
    try {
      final badges = await repository.getBadges(
        userId: params.userId,
        category: params.category,
        rarity: params.rarity,
      );
      return Right(badges);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
