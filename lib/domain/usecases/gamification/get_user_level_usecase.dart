import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

class GetUserLevelParams extends Equatable {
  final String userId;

  const GetUserLevelParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class GetUserLevelUsecase {
  final UserRepository repository;

  GetUserLevelUsecase(this.repository);

  Future<Either<Failure, User>> call(GetUserLevelParams params) async {
    try {
      final profile = await repository.getProfile(params.userId);
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
