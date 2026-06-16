import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/badge.dart';
import 'package:my_badge/domain/repositories/badge_repository.dart';
import 'package:equatable/equatable.dart';

class ClaimBadgeParams extends Equatable {
  final String qrCode;
  final String? eventId;

  const ClaimBadgeParams({required this.qrCode, this.eventId});

  @override
  List<Object?> get props => [qrCode, eventId];
}

class ClaimBadgeUsecase {
  final BadgeRepository repository;

  ClaimBadgeUsecase(this.repository);

  Future<Either<Failure, Badge>> call(ClaimBadgeParams params) async {
    try {
      final badge = await repository.claimBadge(
        qrCode: params.qrCode,
        eventId: params.eventId,
      );
      return Right(badge);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class ClaimBadgeByNfcUsecase {
  final BadgeRepository repository;

  ClaimBadgeByNfcUsecase(this.repository);

  Future<Either<Failure, Badge>> call(String nfcTagId) async {
    try {
      final badge = await repository.claimBadgeByNfc(nfcTagId);
      return Right(badge);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class ClaimBadgeByGeolocationUsecase {
  final BadgeRepository repository;

  ClaimBadgeByGeolocationUsecase(this.repository);

  Future<Either<Failure, Badge>> call(String eventId) async {
    try {
      final badge = await repository.claimBadgeByGeolocation(eventId);
      return Right(badge);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
