import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/user.dart';
import 'package:my_badge/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

class GetProfileParams extends Equatable {
  final String userId;

  const GetProfileParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class GetProfileUsecase {
  final UserRepository repository;

  GetProfileUsecase(this.repository);

  Future<Either<Failure, User>> call(GetProfileParams params) async {
    try {
      final profile = await repository.getProfile(params.userId);
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
