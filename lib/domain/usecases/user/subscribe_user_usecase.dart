import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

class SubscribeUserParams extends Equatable {
  final String userId;

  const SubscribeUserParams({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class SubscribeUserUsecase {
  final UserRepository repository;

  SubscribeUserUsecase(this.repository);

  Future<Either<Failure, void>> call(SubscribeUserParams params) async {
    try {
      await repository.subscribeUser(params.userId);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class UnsubscribeUserUsecase {
  final UserRepository repository;

  UnsubscribeUserUsecase(this.repository);

  Future<Either<Failure, void>> call(SubscribeUserParams params) async {
    try {
      await repository.unsubscribeUser(params.userId);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
